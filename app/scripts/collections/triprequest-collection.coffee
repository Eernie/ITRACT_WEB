class shuttledriveWeb.Collections.TripRequestCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.TripRequestModel

    url: ->
        id = new shuttledriveWeb.Models.Session().get 'user_id'
        shuttledriveWeb.rootPath + '/user/' + id + '/trip_requests'