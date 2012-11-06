class shuttledriveWeb.Models.TripOfferModel extends Backbone.Model
    defaults:
        offerId: ''
        offerUser: ''
        #offerOriginAddress: ''
        offerOriginLong: ''
        offerOriginLat: ''
        offerOriginWindow: ''
        #offerDestinationAddress: ''
        offerDestinationLong: ''
        offerDestinationLat: ''
        offerDestinationWindow: ''
        offerStartTimeMin: ''
        offerStartTimeMax: ''
        offerEndTimeMin: ''
        offerEndTimeMax: ''
        offerNumberOfSeats: ''
        offerState: ''

    validation:
        offerDestinationAddress:
            required: true
            msg: 'Please enter an arrival location'
        offerOriginAddress:
            required: true
            msg: 'Please enter a departure location'


    urlRoot: ->
        shuttledriveWeb.rootPath + '/trip_offer'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @set 'offerOriginAddress': origin
        @set 'offerDestinationAddress': destination
        @getLatLong @, origin, (caller, result) ->
            caller.set 'offerOriginLat': result.Ya
            caller.set 'offerOriginLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'offerDestinationLat': result.Ya
            caller.set 'offerDestinationLong': result.Za
            caller.save({}, 
                success: ->
                    callback(caller.get('offerId'))
                error: ->
                    console.log 'error')

    getLatLong: (caller, address, callback) ->
        geocoder = new google.maps.Geocoder()
        geocoder.geocode { address: address }, (results, status) =>
            if status is google.maps.GeocoderStatus.OK
                result = results[0].geometry.location
                callback(caller, result)
            # else throw error TODO: add throw statement