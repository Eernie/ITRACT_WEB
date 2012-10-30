class shuttledriveWeb.Models.tripMatchesModel extends Backbone.Model
    url: ->
        'http://localhost:5000/match/'+@id

    defaults:
        originAddress: "ddd"
        destinationAddress: "ddd"

    fetchAddress: (originLat, originLong, destinationLat, destinationLong) ->
        @getAddress @, originLat, originLong, @originCallback
        @getAddress @, destinationLat, destinationLong , @destinationCallback

    getAddress: (caller, lat, long, callback) ->
        geocoder = new google.maps.Geocoder()
        latLng = new google.maps.LatLng(lat, long);
        geocoder.geocode 'latLng': latLng , (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                callback(caller, results[0])
            else
                console.log status
                console.log results

    originCallback: (caller, result) ->
        caller.set 'originAddress': result.formated_address
    destinationCallback: (caller, result) ->
        caller.set 'destinationAddress': result.formated_address