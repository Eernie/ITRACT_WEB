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
                console.log data
                view = new shuttledriveWeb.Views.TripRequestView({model: data})
                $(view.render()).appendTo('#content').hide().fadeIn()
                matchView = new shuttledriveWeb.Views.MatchView({model: data.get('matches')})
                $(matchView.render()).appendTo('#content').hide().fadeIn()
                $('.user-popover').popover()
            error: (data, error) ->
                #
                
    tripOfferRoute: ->
        tripOffer = new shuttledriveWeb.Models.TripOfferModel()
        new shuttledriveWeb.Views.TripOfferView({model:tripOffer})

    indexRoute: ->
        tripRequest = new shuttledriveWeb.Models.TripRequestModel()
        new shuttledriveWeb.Views.TripRequestFormView({model: tripRequest})


