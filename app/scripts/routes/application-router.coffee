class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "matches": "matchesRoute"

    matchesRoute: ->
        match = new shuttledriveWeb.Models.tripMatchesModel id: 1
        match.fetch
            success: (data) ->
                console.log data
                view = new shuttledriveWeb.Views.MatchView()
                view.setModel(data)
            error: (data,error) ->
                console.log error
                console.log 'fail'
