class shuttledriveWeb.Collections.TripRequestCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.TripRequestModel

    url: ->
        #id = new shuttledriveWeb.Models.Session().get 'user_id'
        id = 1
        shuttledriveWeb.rootPath + '/user/' + id + '/trip_requests'