class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        originLong: ''
        originLat: ''
        destinationLong: ''
        destinationLat: ''
        startTimeMin: 1352464648
        startTimeMax: 1352471817
        endTimeMin: 1352478409
        endTimeMax: 1352485578
        numberOfSeats: 1
        originAddress: ''
        destinationAddress: ''

    validation:
        requestDestinationAddress:
            required: true
            msg: 'Please enter an arrival location'
        requestOriginAddress:
            required: true
            msg: 'Please enter a departure location'

    urlRoot: ->
        shuttledriveWeb.rootPath + '/api/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @getLatLong @, origin, (caller, result) ->
            caller.set 'originLat': result.Ya
            caller.set 'originLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'destinationLat': result.Ya
            caller.set 'destinationLong': result.Za
            caller.save(caller.toJSON(),
                success: ->
                    callback(caller.get('id'))
                error: ->
                    console.log 'error')

    getLatLong: (caller, address, callback) ->
        geocoder = new google.maps.Geocoder()
        geocoder.geocode { address: address }, (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                result = results[0].geometry.location
                callback(caller, result)
            # else throw error TODO: add throw statement

