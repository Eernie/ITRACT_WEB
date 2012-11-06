class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'

    initialize: ->
        @render()

    render: ->
        
        notification = [
            {name:'item',content:'bladieblad'}
            {name:'item2',content:'bladieblad2'}
        ]

        $(@el).html(Handlebars.templates['menuView']({
            'nrOfNoticifications': notification.length, 
            'notifications': Handlebars.templates['notificationsView']({notifications: notification})
        }))
        $('#notifications').popover()