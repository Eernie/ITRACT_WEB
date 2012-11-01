class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "matches": "matchesRoute"
        "" : "indexRoute"

    matchesRoute: ->
        console.log 'matchesRoute'
        match = new shuttledriveWeb.Models.TripMatchesModel({id: 1})
        match.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.MatchView()
                view.setModel(data)
            error: (data,error) ->
                console.log error
                console.log 'fail'

    indexRoute: ->
        console.log 'indexRoute'
        applicationView = new shuttledriveWeb.Views.ApplicationView()
