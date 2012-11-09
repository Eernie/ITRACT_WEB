class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'

    initialize: ->
        @render()

    render: ->
        
        
        $(@el).html(Handlebars.templates['menuView']({}))

        notification = new shuttledriveWeb.Views.NotificationView({collection: new shuttledriveWeb.Collections.NotificationCollection()})
        
