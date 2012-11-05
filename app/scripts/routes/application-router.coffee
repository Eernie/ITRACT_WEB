class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "triprequest/:id": "tripRequestRoute"
        "matches": "matchesRoute"
        "tripoffer": "tripOfferRoute"
        "": "indexRoute"

    tripRequestRoute: (id) ->
        match = new shuttledriveWeb.Models.TripMatchesModel({id: id})
        match.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.MatchView({model: data})
                console.log view
                $('#content').html('') # empty the div each time the route gets called
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data,error) ->
                console.log error
                console.log 'fail'

        tripRequest = new shuttledriveWeb.Models.TripRequestModel({id: id})
        tripRequest.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.TripRequestView({model: data})
                console.log view
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data, error) ->
                #

    indexRoute: ->
        applicationView = new shuttledriveWeb.Views.ApplicationView()

    tripOfferRoute: ->
        #applicationView = new shuttledriveWeb.Views.ApplicationView()
        tripOfferView = new shuttledriveWeb.Views.TripOfferView()
