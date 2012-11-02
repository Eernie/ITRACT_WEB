class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        user: 1
        originLat: 0
        originLong: 0
        destinationLat: 0
        destinationLong: 0
        startTimeMin: 0
        startTimeMax: 0
        endTimeMin: 0
        endTimeMax: 0
        numberOfSeats: 4
        request_end_time_max: 0
        request_id: 0

    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_request'

    # initialize: ->
    #     @bind('change', @save) # TODO: maybe refactor to only send a request when all data has been fetched from Google

    fetchCoordinates: (origin, destination) ->
        @set 'originAddress': origin
        @set 'destinationAddress': destination
        @getLatLong @, origin, @originCallback
        @getLatLong @, destination, @destinationCallback

    getLatLong: (caller, address, callback) ->
        geocoder = new google.maps.Geocoder()
        geocoder.geocode { address: address }, (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                result = results[0].geometry.location
                callback(caller, result)
            # else throw error TODO: add throw statement

    originCallback: (caller, result) ->
        caller.set 'originLat': result.Ya
        caller.set 'originLong':  result.Za

    destinationCallback: (caller, result) ->
        caller.set 'destinationLat': result.Ya
        caller.set 'destinationLong': result.Za