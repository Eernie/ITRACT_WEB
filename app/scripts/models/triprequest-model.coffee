class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        requestId: ''
        requestUser: ''
        #requestOriginAddress: ''
        requestOriginLong: ''
        requestOriginLat: ''
        requestOriginWindow: ''
        #requestDestinationAddress: ''
        requestDestinationLong: ''
        requestDestinationLat: ''
        requestDestinationWindow: ''
        requestStartTimeMin: 1
        requestStartTimeMax: 1
        requestEndTimeMin: 1
        requestEndTimeMax: 1
        requestNumberOfSeats: 4
        requestState: ''


    validation:
        requestDestinationAddress:
            required: true
            msg: 'Please enter an arrival location'
        requestOriginAddress:
            required: true
            msg: 'Please enter a departure location'



    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @set 'requestOriginAddress': origin
        @set 'requestDestinationAddress': destination
        console.log(origin)
        console.log(@requestOriginAddress)
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
