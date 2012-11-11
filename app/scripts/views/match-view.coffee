class shuttledriveWeb.Views.MatchView extends Backbone.View
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
        match.fetch # why are we fetching the match here
            success:(data) ->
                data.set 'matchState': 1 # and then updating it here
                data.set 'confirm': true
                data.save(
                    data.toJSON # only to save it again here, while we already fetched the model in the router
                    ,
                    success: ->
                        $(element.currentTarget).attr("disabled","true")
                        $(element.currentTarget).html('&#x2713; Joined')
                        $(element.currentTarget).toggleClass('btn-primary btn-success')

                    error: ->
                        console.log ' error'
                )

            error:(data, error) ->
                console.log data
                console.log error