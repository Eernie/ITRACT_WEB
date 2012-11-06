class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "triprequest/:id": "tripRequestRoute" 
        "": "indexRoute"

    tripRequestRoute: (id) ->
        $('#content').html('') # empty the div each time the route gets called
        match = new shuttledriveWeb.Models.TripMatchesModel({id: id})
        match.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.MatchView({model: data})
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data,error) ->
                console.log error
                console.log 'fail'

        tripRequest = new shuttledriveWeb.Models.TripRequestModel({id: id})
        tripRequest.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.TripRequestView({model: data})
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data, error) ->
                #

    indexRoute: ->
        applicationView = new shuttledriveWeb.Views.ApplicationView()
