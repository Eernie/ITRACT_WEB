class shuttledriveWeb.Views.MatchView extends Backbone.View
    model: shuttledriveWeb.Models.tripMatchesModel


    render:  ->
        context = {
            "request" :@model.get('tripRequest'),
            "matches" :@model.get('tripMatches')
        }
        console.log context
        $(@el).html(Handlebars.templates['matchView'](context))

