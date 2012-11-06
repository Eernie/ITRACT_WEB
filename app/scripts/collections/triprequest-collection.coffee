class shuttledriveWeb.Collections.TripRequestCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.TripRequestModel

    url: ->
        shuttledriveWeb.rootPath + '/trip_request'
        #shuttledriveWeb.rootPath + '/user/' + @userId + '/tripRequests'

    parse: (response) ->
        response.tripRequests