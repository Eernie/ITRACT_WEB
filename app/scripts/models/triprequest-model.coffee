class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        user: 'Cheerio!'
        originLat: 0
        originLong: 0
        destinationLat: 0
        destinationLong: 0

    constructor: (origin, destination) ->
        currentTime = new Date()
        @getLatLong @, origin, @originCallback
        # @getLatLong @, destination, @destinationCallback

    getLatLong: (caller, address, callback) ->
        geocoder = new google.maps.Geocoder()
        geocoder.geocode { address: address }, (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                result = results[0].geometry.location
                callback(caller, result)
            # else throw error TODO: add throw statement

    originCallback: (caller, result) ->
        console.log caller.defaults
        caller.set 'originLat': result.Ya
        caller.set 'originLong':  result.Za

    destinationCallback: (caller, result) ->
        caller.destinationLat = result.Ya
        caller.destinationLong = result.Za
