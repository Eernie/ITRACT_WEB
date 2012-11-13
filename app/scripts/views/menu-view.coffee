class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'
    notification: new Object()

    initialize: ->
        @render()

    render: ->      
        $(@el).html(Handlebars.templates['menuView']({}))
        session = new shuttledriveWeb.Models.Session()
        # only display notifications when logged in
        if session.authenticated()
            @notification = new shuttledriveWeb.Views.NotificationView({collection: new shuttledriveWeb.Collections.NotificationCollection()})

    logout: ->
        clearInterval(@notification.interval)
        @render()
        
