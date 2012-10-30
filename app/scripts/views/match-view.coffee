class shuttledriveWeb.Views.MatchView extends Backbone.View
    el: $ '#content'
    model: shuttledriveWeb.Models.tripMatchesModel
    request = ''

    setModel: (data) ->
        @model = data
        _.bindAll @, 'render'
        @model.bind 'change', @render

        @render()

    render:  ->

        console.log @model 
        context = {
            "request" :@model.attributes.tripRequest,
            "matches" :@model.attributes.tripMatches
        }
        console.log context
        $(@el).html(Handlebars.templates['matchView'](context))

