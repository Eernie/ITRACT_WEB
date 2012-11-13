class shuttledriveWeb.Views.TripRequestFormView extends Backbone.View
    el: $ '#content'


    events:
        "click #trip-request-submit": "createOnSubmit"

    initialize: ->
        @getLocation()
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
        @model.set({originAddress: from, destinationAddress: to})

        @model.saveWithOriginAndDestination(from, to, (id) ->
            shuttledriveWeb.app.navigate 'triprequest/' + id, {trigger: true}
        )

    getLocation: ->
        if(navigator.geolocation)
            navigator.geolocation.getCurrentPosition(@showPosition)
        else
            error 'Geolocation is not supported'
    
    showPosition: (position)->
        valueLat = position.coords.latitude 
        valueLong = position.coords.longitude
                
        point = new google.maps.LatLng(valueLat, valueLong)
        geocoder = new google.maps.Geocoder()
        geocoder.geocode
            latLng: point
        , (results, status) ->
            $("#test").html results[0].formatted_address
            $('#from').attr("value", results[0].formatted_address)