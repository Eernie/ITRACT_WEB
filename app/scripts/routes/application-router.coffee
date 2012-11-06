class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "triprequest/:id": "tripRequestRoute"
        "matches": "matchesRoute"
        "tripoffer": "tripOfferRoute"
        "": "indexRoute"

    tripRequestRoute: (id) ->
        $('#content').html('') # empty the div each time the route gets called
        tripRequest = new shuttledriveWeb.Models.TripRequestModel({id: id})
        tripRequest.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.TripRequestView({model: data})
                console.log view
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data, error) ->
                #

        match = new shuttledriveWeb.Models.TripMatchesModel({id: id})
        match.fetch
            success: (data) ->
                view = new shuttledriveWeb.Views.MatchView({model: data})
                console.log view
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data,error) ->
                console.log error
                console.log 'fail'

    tripOfferRoute: ->
        tripOffer = new shuttledriveWeb.Models.TripOfferModel()
        new shuttledriveWeb.Views.TripOfferView({model:tripOffer})

    indexRoute: ->
        tripRequest = new shuttledriveWeb.Models.TripRequestModel()
        new shuttledriveWeb.Views.TripRequestFormView({model: tripRequest})
