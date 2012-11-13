class shuttledriveWeb.Views.MatchView extends Backbone.View
    events:
        "click .apply-join": "createOnJoin"

    render:  ->
        $(@el).html(Handlebars.templates['matchView']({'matches': @collection.toJSON()}))

    createOnJoin: (e) ->
        id = $(e.currentTarget).attr("id")
        match = @collection.get(id)
        console.log @collection
        console.log id
        console.log match
        match.set('state', 1)
        match.save(
            match.toJSON(),
            success: ->
                $(e.currentTarget).attr("disabled","true")
                $(e.currentTarget).html('&#x2713; Request sent')
                $(e.currentTarget).toggleClass('btn-primary btn-success')
            error: (data, error) ->
                console.log error
        )