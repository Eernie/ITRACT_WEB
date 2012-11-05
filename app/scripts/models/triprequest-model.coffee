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
        requestStartTimeMin: 1
        requestStartTimeMax: 1
        requestEndTimeMin: 1
        requestEndTimeMax: 1
        requestNumberOfSeats: 4
        requestState: ''

    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_request'
        # 'http://145.37.60.50:8080/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @set 'requestOriginAddress': origin
        @set 'requestDestinationAddress': destination
        @getLatLong @, origin, (caller, result) ->
            caller.set 'requestOriginLat': result.Ya
            caller.set 'requestOriginLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'requestDestinationLat': result.Ya
            caller.set 'requestDestinationLong': result.Za
            caller.save(caller.toJSON(), 
                success: ->
                    console.log caller
                    console.log caller.get 'requestId'
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

    parse: (resp, xhr) ->
        requestId: resp.tripRequest.requestId
        requestUser: resp.tripRequest.requestUser
        requestOriginAddress: resp.tripRequest.requestOriginAddress
        requestOriginLong: resp.tripRequest.requestOriginLong
        requestOriginLat: resp.tripRequest.requestOriginLat
        requestOriginWindow: resp.tripRequest.requestOriginWindow
        requestDestinationAddress: resp.tripRequest.requestDestinationAddress
        requestDestinationLong: resp.tripRequest.requestDestinationLong
        requestDestinationLat: resp.tripRequest.requestDestinationLat
        requestDestinationWindow: resp.tripRequest.requestDestinationWindow
        requestStartTimeMin: resp.tripRequest.requestStartTimeMin
        requestStartTimeMax: resp.tripRequest.requestStartTimeMax
        requestEndTimeMin: resp.tripRequest.requestEndTimeMin
        requestEndTimeMax: resp.tripRequest.requestEndTimeMax
        requestNumberOfSeats: resp.tripRequest.requestNumberOfSeats
        requestState: resp.tripRequest.requestState