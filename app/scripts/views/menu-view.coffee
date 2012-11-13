class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'
    notification: new Object()

    initialize: ->
        @render()

    render: ->    
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            loggedIn = true
            context = {
                loggedIn: true,
                username: session.get('username'),
                userId: session.get('user_id'),
                profilePicture: session.get('profilePicture')
            }
        else
            context = {loggedIn: false}
            console.log context
        $(@el).html(Handlebars.templates['menuView'](context))
        # only display notifications when logged in
        if loggedIn
            @notification = new shuttledriveWeb.Views.NotificationView({collection: new shuttledriveWeb.Collections.NotificationCollection()})

    logout: ->
        clearInterval(@notification.interval)
        @render()
        
