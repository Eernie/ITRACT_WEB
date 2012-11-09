class shuttledriveWeb.Views.NotificationView extends Backbone.View
    el: '#nots' 

    initialize: ->
        _.bindAll @, 'render'
        @collection.bind 'reset', @render
        setInterval (=>
          @collection.fetch()
        ), 10000

    render: -> 
        console.log @collection.toJSON()


        $('#nots').html(Handlebars.templates['notificationsView']({'notifications': @collection.toJSON() }))
        $('#notifications').popover()

        console.log @$('#notificationsContent')