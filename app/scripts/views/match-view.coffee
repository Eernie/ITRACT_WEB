class shuttledriveWeb.Views.MatchView extends Backbone.View
    model: shuttledriveWeb.Models.tripMatchesModel

    events:
        "click .apply-join": "createOnJoin"

    render:  ->
        context = {
            'request': @model.get('tripRequest'),
            'matches': @model.get('tripMatches')
        }

        console.log context
        $(@el).html(Handlebars.templates['matchView'](context))

    createOnJoin: (element)->
        id = $(element.currentTarget).attr("id")
        match = new shuttledriveWeb.Models.TripMatchModel({id: id})
        match.fetch
            success:(data) ->
                data.set 'matchState': 'POTENTIAL'
                data.set 'confirm': true
                data.save(
                    data.toJSON
                    ,
                    success: ->
                        console.log "we successed!"
                    error: ->
                        console.log "we fail! Yellow submarine"
                )

            error:(data, error) ->
                console.log data
                console.log error