class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        originLong: ''
        originLat: ''
        destinationLong: ''
        destinationLat: ''
        numberOfSeats: 1


    validation:
        destinationAddress:
            required: true
            msg: 'Please enter an arrival location'
        originAddress:
            required: true
            msg: 'Please enter a departure location'


    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @getLatLong @, origin, (caller, result) ->
            caller.set 'originLat': result.Ya
            caller.set 'originLong':  result.Za
            caller.getLatLong caller, destination, (caller, result) ->
                caller.set 'destinationLat': result.Ya
                caller.set 'destinationLong': result.Za
                caller.save(caller.toJSON(),
                    headers:
                        "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
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


