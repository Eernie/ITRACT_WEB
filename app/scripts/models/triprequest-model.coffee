class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        requestId: ''
        requestUser: ''
        requestOriginAddress: ''
        requestOriginLong: ''
        requestOriginLat: ''
        requestOriginWindow: ''
        requestDestinationAddress: ''
        requestDestinationLong: ''
        requestDestinationLat: ''
        requestDestinationWindow: ''
        requestStartTimeMin: ''
        requestStartTimeMax: ''
        requestEndTimeMin: ''
        requestEndTimeMax: ''
        requestNumberOfSeats: ''
        requestState: ''

    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @set 'requestOriginAddress': origin
        @set 'requestDestinationAddress': destination
        @getLatLong @, origin, (caller, result) ->
            caller.set 'requestOriginLat': result.Ya
            caller.set 'requestOriginLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'requestDestinationLat': result.Ya
            caller.set 'requestDestinationLong': result.Za
            caller.save({}, 
                success: ->
                    callback(caller.get('requestId'))
                error: ->
                    console.log 'error')

    getLatLong: (caller, address, callback) ->
        geocoder = new google.maps.Geocoder()
        geocoder.geocode { address: address }, (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                result = results[0].geometry.location
                callback(caller, result)
            # else throw error TODO: add throw statement