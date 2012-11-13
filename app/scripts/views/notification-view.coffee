class shuttledriveWeb.Views.NotificationView extends Backbone.View
    el: '#nots' 

    events:
        "click .notification-list-item": 'showModal'

    initialize: ->
        _.bindAll @, 'render'
        @render()
        @collection.bind 'reset remove', @update
        @interval = setInterval (=>
            @collection.fetch()
        ), 10000

    render: -> 
        $('#nots').html(Handlebars.templates['notificationsView']({'notifications': @collection.toJSON()}))
        $('#notifications-content').html(Handlebars.templates['notificationsContent']({'notifications': @collection.toJSON()}))

    update: () ->
        $('#notification-count').html(@length)
        $('#notifications-content').html(Handlebars.templates['notificationsContent']({'notifications': @toJSON()}))

    showModal: (e) ->
        # get the id from the link that has just been clicked, it's stored on a data attribute called data-id
        id = $(e.currentTarget).data('id')
        # get that notification from the collection
        notification = @collection.get(id)

        userId = new shuttledriveWeb.Models.Session().get 'user_id'
        tripMatch = new shuttledriveWeb.Models.TripMatchModel(notification.get 'tripMatch')
        tripOffer = new shuttledriveWeb.Models.TripOfferModel(tripMatch.get 'tripOffer')
        tripRequest = new shuttledriveWeb.Models.TripRequestModel(tripMatch.get 'tripRequest')
        if +userId is +tripOffer.toJSON().user.id
            matchedTrip = tripRequest
            userTrip = tripOffer
        else
            matchedTrip = tripOffer
            userTrip = tripReqeust
        context = {
            #user : new shuttledriveWeb.Models.UserModel({ id : userId})
            userTrip : userTrip.toJSON()
            notification : notification.toJSON()
            matchedTrip : matchedTrip.toJSON()
        }
        console.log context
        # create a modal for it and store it in a div temporarily
        $('#modals').append(Handlebars.templates['notificationModal'](context))
        # jquery selector for the newly created modal
        notificationModal = $('.notification-' + id)
        # show the modal
        notificationModal.modal('show')
        $(".modal").css("width", "650px")
        $(".modal").css("margin", "-295px 0 0 -325px")
        # when clicking either of the buttons in the modal fade out the backdrop 
        # and remove the modal from the container that we stored it in
        $('#accept-notification').click =>
            notification.updateStatusAccept()
            @collection.remove(notification.get('id'))
            notification.destroy()
            $('.modal-backdrop').fadeOut ->
                $('#modals').html('')
         $('#decline-notification').click =>
            notification.updateStatusDecline()
            @collection.remove(notification.get('id'))
            notification.destroy()
            $('.modal-backdrop').fadeOut ->
                $('#modals').html('')
        $('#dismiss-notification').click =>
            @collection.remove(notification.get('id'))
            notification.destroy()
            $('.modal-backdrop').fadeOut ->
                $('#modals').html('')

