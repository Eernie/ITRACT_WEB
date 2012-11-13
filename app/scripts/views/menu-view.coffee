class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'
    notification: new Object()

    initialize: ->
        @render()

    render: ->    
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            loggedIn = true
        $(@el).html(Handlebars.templates['menuView']({'loggedIn': loggedIn}))
        # only display notifications when logged in
        if loggedIn
            @notification = new shuttledriveWeb.Views.NotificationView({collection: new shuttledriveWeb.Collections.NotificationCollection()})

    logout: ->
        clearInterval(@notification.interval)
        @render()
        
