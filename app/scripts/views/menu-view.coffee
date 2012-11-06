class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'

    initialize: ->
        @render()

    render: ->
        
        notification = [
            {title:'item',message:'bladieblad',id:'not1'}
            {title:'item2',message:'bladieblad2',id:'not2'}
        ]

        $(@el).html(Handlebars.templates['menuView']({
            'nrOfNoticifications': notification.length, 
            'notifications': Handlebars.templates['notificationsView']({notifications: notification})
        }))
        $('#notifications').popover()
