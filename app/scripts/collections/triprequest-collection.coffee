class shuttledriveWeb.Collections.TripRequestCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.TripRequestModel

    url: ->
        #shuttledriveWeb.rootPath + '/trip_request'
        shuttledriveWeb.rootPath + '/user/1/trip_requests'