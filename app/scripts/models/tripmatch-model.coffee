class shuttledriveWeb.Models.TripMatchModel extends Backbone.Model
    url: ->
        shuttledriveWeb.rootPath + '/trip_match/' + @id

    # override sync to include the authorization headers
    sync: (method, model, options)->
            options.headers = "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
            Backbone.sync(method, model, options)
