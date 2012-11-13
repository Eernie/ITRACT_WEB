class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
    routes: 
        "triprequest/:id": "tripRequestRoute"
        "userprofile/:id": "userProfile"
        "tripoffer/:id": "tripOfferDetailRoute"
        "triprequest": "indexRoute"
        "matches": "matchesRoute"
        "tripoffer": "tripOfferRoute"
        "tripoverview": "tripOverviewRoute"
        "login": "loginRoute"
        "logout": "logoutRoute"
        "register": "registerRoute"
        "": "indexRoute"

    tripRequestRoute: (id) ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            $('#content').html('') # empty the div each time the route gets called
            tripRequest = new shuttledriveWeb.Models.TripRequestModel({id: id})
            tripRequest.fetch(
                headers:
                    "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
                success: (data) ->
                    console.log data

                    view = new shuttledriveWeb.Views.TripRequestView({model: data})
                    $(view.render()).appendTo('#content').hide().fadeIn()
                    matchCollection = new shuttledriveWeb.Collections.MatchCollection data.get('matches')
                    matchView = new shuttledriveWeb.Views.MatchView({collection: matchCollection})
                    $(matchView.render()).appendTo('#content').hide().fadeIn()
                    $('.user-popover').popover()
                error: (data, error) ->
                    console.log(data)
                    console.log(error)
            )
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}

    userProfile: (id) ->
        $('#content').html('')

        userProfile = new shuttledriveWeb.Models.UserProfileModel({id: id})
        userProfile.fetch
            headers:
                "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
            success: (data) ->
                view = new shuttledriveWeb.Views.UserProfileView({model: data})
                $(view.render()).appendTo('#content').hide().fadeIn()
            error: (data, error) ->
                #

    tripOfferRoute: ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            tripOffer = new shuttledriveWeb.Models.TripOfferModel()
            new shuttledriveWeb.Views.TripOfferView({model:tripOffer})
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}


    indexRoute: ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            shuttledriveWeb.menu.render()
            tripRequest = new shuttledriveWeb.Models.TripRequestModel()
            new shuttledriveWeb.Views.TripRequestFormView({model: tripRequest})
        else
            shuttledriveWeb.app.navigate 'login', {trigger: true}


    tripOverviewRoute: ->
        new shuttledriveWeb.Views.TripOverviewView()

    loginRoute: ->
        session = new shuttledriveWeb.Models.Session()
        if session.authenticated()
            shuttledriveWeb.app.navigate 'triprequest', {trigger: true}
        else
            new shuttledriveWeb.Views.LoginView()


    logoutRoute: ->
        new shuttledriveWeb.Models.Session().deleteCookie()
        shuttledriveWeb.menu.logout()
        shuttledriveWeb.app.navigate 'login', {trigger: true}

    registerRoute: ->
        newuser = new shuttledriveWeb.Models.NewUserModel()
        new shuttledriveWeb.Views.RegisterView({model: newuser})

