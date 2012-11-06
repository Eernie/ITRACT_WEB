class shuttledriveWeb.Models.TripOfferModel extends Backbone.Model
    defaults:
        offerId: ''
        offerUser: '1'
        #offerOriginAddress: ''
        offerOriginLong: ''
        offerOriginLat: ''
        offerOriginWindow: '1'
        #offerDestinationAddress: ''
        offerDestinationLong: ''
        offerDestinationLat: ''
        offerDestinationWindow: '1'
        #offerStartTimeMin: 0
        #offerStartTimeMax: 0
        #offerEndTimeMin: 0
        #offerEndTimeMax: 0
        offerNumberOfSeats: '4'
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
        @getLatLong @, origin, (caller, result) ->
            caller.set 'offerOriginLat': result.Ya
            caller.set 'offerOriginLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'offerDestinationLat': result.Ya
            caller.set 'offerDestinationLong': result.Za
            caller.save(caller.toJSON(), 
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

    parse: (resp, xhr) ->
        if resp.tripMatches
            offerId: resp.tripOffer.offerId
            offerUser: resp.tripOffer.offerUser
            offerOriginAddress: resp.tripOffer.offerOriginAddress
            offerOriginLong: resp.tripOffer.offerOriginLong
            offerOriginLat: resp.tripOffer.offerOriginLat
            offerOriginWindow: resp.tripOffer.offerOriginWindow
            offerDestinationAddress: resp.tripOffer.offerDestinationAddress
            offerDestinationLong: resp.tripOffer.offerDestinationLong
            offerDestinationLat: resp.tripOffer.offerDestinationLat
            offerDestinationWindow: resp.tripOffer.offerDestinationWindow
            offerStartTimeMin: resp.tripOffer.offerStartTimeMin
            offerStartTimeMax: resp.tripOffer.offerStartTimeMax
            offerEndTimeMin: resp.tripOffer.offerEndTimeMin
            offerEndTimeMax: resp.tripOffer.offerEndTimeMax
            offerNumberOfSeats: resp.tripOffer.offerNumberOfSeats
            offerState: resp.tripOffer.offerState
        else
            offerId: resp.offerId
            offerUser: resp.offerUser
            offerOriginAddress: resp.offerOriginAddress
            offerOriginLong: resp.offerOriginLong
            offerOriginLat: resp.offerOriginLat
            offerOriginWindow: resp.offerOriginWindow
            offerDestinationAddress: resp.offerDestinationAddress
            offerDestinationLong: resp.offerDestinationLong
            offerDestinationLat: resp.offerDestinationLat
            offerDestinationWindow: resp.offerDestinationWindow
            offerStartTimeMin: resp.offerStartTimeMin
            offerStartTimeMax: resp.offerStartTimeMax
            offerEndTimeMin: resp.offerEndTimeMin
            offerEndTimeMax: resp.offerEndTimeMax
            offerNumberOfSeats: resp.offerNumberOfSeats
            offerState: resp.offerState
