class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "triprequest/:id": "tripRequestRoute"
        "triprequest": "indexRoute"
        "matches": "matchesRoute"
        "tripoffer": "tripOfferRoute"
        "": "indexRoute"
        "login": "loginRoute"



    tripRequestRoute: (id) ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            $('#content').html('') # empty the div each time the route gets called

            tripRequest = new shuttledriveWeb.Models.TripRequestModel({id: id})
            tripRequest.fetch
                success: (data) ->
                    view = new shuttledriveWeb.Views.TripRequestView({model: data})
                    $(view.render()).appendTo('#content').hide().fadeIn()
                error: (data, error) ->
                    #

            match = new shuttledriveWeb.Models.TripMatchesModel({id: id})
            match.fetch
                success: (data) ->
                    view = new shuttledriveWeb.Views.MatchView({model: data})
                    $(view.render()).appendTo('#content').hide().fadeIn()
                error: (data,error) ->
                    console.log error
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}

    tripOfferRoute: ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            tripOffer = new shuttledriveWeb.Models.TripOfferModel()
            new shuttledriveWeb.Views.TripOfferView({model:tripOffer})
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}

    indexRoute: ->
        console.log("is authenticated")
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            console.log("is authenticated")
            tripRequest = new shuttledriveWeb.Models.TripRequestModel()
            new shuttledriveWeb.Views.TripRequestFormView({model: tripRequest})
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}

    loginRoute: ->
        new shuttledriveWeb.Views.LoginView()


