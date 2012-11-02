class shuttledriveWeb.Views.MatchView extends Backbone.View
    model: shuttledriveWeb.Models.tripMatchesModel

    events:
        "click .apply-join": "createOnJoin"

    render:  ->
        context = {
            "request" :@model.get('tripRequest'),
            "matches" :@model.get('tripMatches')
        }
        console.log context
        $(@el).html(Handlebars.templates['matchView'](context))

    createOnJoin: (element)->
        console.log $(element.currentTarget).attr("id")