class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'

    initialize: ->
        @render()

    render: ->
        
        notification = [
            {title:'Trip request accepted',message:'Your trip request from Groningen to Zwolle has been accepted by the offerer. Please confirm this.',id:'not1'}
            {title:'You received a trip request',message:'Someone would like to travel with you on your trip from Amsterdam to Rotterdam. Please confirm this.',id:'not2'}
        ]

        $(@el).html(Handlebars.templates['menuView']({
            'nrOfNoticifications': notification.length, 
            'notifications': Handlebars.templates['notificationsView']({notifications: notification})
        }))
        $('#notifications').popover()
