class shuttledriveWeb.Views.TripRequestFormView extends Backbone.View
    el: $ '#content'


    events:
        "click #trip-request-submit": "createOnSubmit"
        "click #origin-geolocation": "getLocationOrigin"
        "click #destination-geolocation": "getLocationDestination"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        Backbone.Validation.bind this
        $(@el).html(Handlebars.templates['triprequest-form-view'](context))
        $('.timepicker-default').timepicker({showMeridian: false, showSeconds: false, minuteStep: 5})

    createOnSubmit: ->
        from = $('#from').val()
        to = $('#to').val()
        time = $('#time').val()
        arrivalRadio = $('#arrival-time').attr('checked')
        departureRadio = $('#departure-time').attr('checked')

        if arrivalRadio is 'checked'
            @model.set({originAddress: from, destinationAddress: to,endTimeMax:shuttledriveWeb.Helpers.TimeHelper.addHour(time,2),  endTimeMin: shuttledriveWeb.Helpers.TimeHelper.getDate(time)})
        else if departureRadio is 'checked'
            @model.set({originAddress: from, destinationAddress: to,startTimeMax: shuttledriveWeb.Helpers.TimeHelper.addHour(time,2),startTimeMin: shuttledriveWeb.Helpers.TimeHelper.getDate(time)})
        else
            @model.set({originAddress: from, destinationAddress: to})


        @model.saveWithOriginAndDestination(from, to, (id) ->
            shuttledriveWeb.app.navigate 'triprequest/' + id, {trigger: true}
        )

    getLocationOrigin: ->
        if(navigator.geolocation)
            navigator.geolocation.getCurrentPosition(@showPositionOrigin)
        else
            error 'Geolocation is not supported'
    
    showPositionOrigin: (position)->
        valueLat = position.coords.latitude 
        valueLong = position.coords.longitude
        point = new google.maps.LatLng(valueLat, valueLong)
        geocoder = new google.maps.Geocoder()
        geocoder.geocode
            latLng: point
        , (results, status) ->
            $('#from').attr("value", results[0].formatted_address)

    getLocationDestination: ->
        if(navigator.geolocation)
            navigator.geolocation.getCurrentPosition(@showPositionDestion)
        else
            error 'Geolocation is not supported'
    
    showPositionDestion: (position)->
        valueLat = position.coords.latitude 
        valueLong = position.coords.longitude
        point = new google.maps.LatLng(valueLat, valueLong)
        geocoder = new google.maps.Geocoder()
        geocoder.geocode
            latLng: point
        , (results, status) ->
            $('#to').attr("value", results[0].formatted_address)