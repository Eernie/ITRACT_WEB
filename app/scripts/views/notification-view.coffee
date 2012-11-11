class shuttledriveWeb.Views.NotificationView extends Backbone.View
    el: '#nots' 

    events:
        "click .notification-list-item": 'showModal'

    initialize: ->
        _.bindAll @, 'render'
        @render()
        @collection.bind 'reset', @update unless @modalActive
        setInterval (=>
          @collection.fetch()
        ), 100000

    render: -> 
        $('#nots').html(Handlebars.templates['notificationsView']({'notifications': @collection.toJSON()}))
        $('#notifications-content').html(Handlebars.templates['notificationsContent']({'notifications': @collection.toJSON()}))

    update: (modalActive = @modalActive) ->
        $('#notification-count').html(@.length)
        $('#notifications-content').html(Handlebars.templates['notificationsContent']({'notifications': @toJSON()}))

    showModal: (e) ->
        # get the id from the link that has just been clicked, it's stored on a data attribute called data-id
        id = $(e.currentTarget).data('id')
        # get that notification from the collection
        notification = @collection.get(id)
        console.log notification
        # create a modal for it and store it in a div temporarily
        $('#modals').append(Handlebars.templates['notificationModal'](notification.toJSON()))
        # jquery selector for the newly created modal
        notificationModal = $('.notification-' + id)
        # show the modal
        notificationModal.modal('show')
        # when clicking either of the buttons in the modal fade out the backdrop 
        # and remove the modal from the container that we stored it in
        $('.modal-dismiss').click -> 
            $('.modal-backdrop').fadeOut ->
                $('#modals').html('')
