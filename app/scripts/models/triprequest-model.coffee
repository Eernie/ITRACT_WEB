class shuttledriveWeb.Models.TripRequestModel extends Backbone.Model
    defaults:
        requestId: ''
        requestUser: '1'
        #requestOriginAddress: ''
        requestOriginLong: ''
        requestOriginLat: ''
        requestOriginWindow: '1'
        #requestDestinationAddress: ''
        requestDestinationLong: ''
        requestDestinationLat: ''
        requestDestinationWindow: '1'
        requestStartTimeMin: shuttledriveWeb.Helpers.TimeHelper.formatUnixTimestamp(new Date("Wed, 07 Nov 2012 12:00:00 GMT+01"))
        requestStartTimeMax: shuttledriveWeb.Helpers.TimeHelper.formatUnixTimestamp(new Date("Wed, 07 Nov 2012 12:00:00 GMT+01"))
        requestEndTimeMin: shuttledriveWeb.Helpers.TimeHelper.formatUnixTimestamp(new Date("Wed, 07 Nov 2012 13:00:00 GMT+01"))
        requestEndTimeMax: shuttledriveWeb.Helpers.TimeHelper.formatUnixTimestamp(new Date("Wed, 07 Nov 2012 13:00:00 GMT+01"))
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
        shuttledriveWeb.rootPath + '/api/trip_request'

    saveWithOriginAndDestination: (origin, destination, callback) ->
        @getLatLong @, origin, (caller, result) ->
            caller.set 'requestOriginLat': result.Ya
            caller.set 'requestOriginLong':  result.Za
        @getLatLong @, destination, (caller, result) ->
            caller.set 'requestDestinationLat': result.Ya
            caller.set 'requestDestinationLong': result.Za
            caller.save(caller.toJSON(),
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


    parse: (resp, xhr) ->
        if resp.tripMatches
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
        else
            requestId: resp.requestId
            requestUser: resp.requestUser
            requestOriginAddress: resp.requestOriginAddress
            requestOriginLong: resp.requestOriginLong
            requestOriginLat: resp.requestOriginLat
            requestOriginWindow: resp.requestOriginWindow
            requestDestinationAddress: resp.requestDestinationAddress
            requestDestinationLong: resp.requestDestinationLong
            requestDestinationLat: resp.requestDestinationLat
            requestDestinationWindow: resp.requestDestinationWindow
            requestStartTimeMin: resp.requestStartTimeMin
            requestStartTimeMax: resp.requestStartTimeMax
            requestEndTimeMin: resp.requestEndTimeMin
            requestEndTimeMax: resp.requestEndTimeMax
            requestNumberOfSeats: resp.requestNumberOfSeats
            requestState: resp.requestState
