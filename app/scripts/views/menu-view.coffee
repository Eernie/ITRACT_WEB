class shuttledriveWeb.Views.MenuView extends Backbone.View
    el: '#menu'

    initialize: ->
        @render()

    render: ->
        $(@el).html(Handlebars.templates['menuView']({'notifications': '1'}))