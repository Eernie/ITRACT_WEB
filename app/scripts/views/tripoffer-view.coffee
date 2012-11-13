class shuttledriveWeb.Views.TripOfferView extends Backbone.View
    el: $ '#content'
    tagName : "input"

    events:
        "click #trip-offer-submit": "createOnSubmit"

    initialize: ->
        @getLocation()
        _.bindAll @
        @render()

    getLocation: ->
        if(navigator.geolocation)
            navigator.geolocation.getCurrentPosition(@showPosition)
        else
            error 'Geolocation is not supported'
    
    showPosition: (position)->
        valueLat = position.coords.latitude 
        valueLong = position.coords.longitude
        $('#from').attr("value", valueLat + " - " + valueLong)

        geocoder = new google.maps.Geocoder()
        latlng = new google.maps.LatLng(valueLat, valueLong)
        console.log geocoder
        console.log latlng
        geocoder.geocode
            latLng: latlng
        , (responses) ->
            console.log responses " <- responses"
            if responses and responses.length > 0
                updateMarkerAddress responses[0].address_components
            else
                updateMarkerAddress "Cannot determine address at this location."
            
    render: ->
        script = document.createElement("script")
        script.type = "text/javascript"
        script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyB0lcHPjqt73yynb_wV6HyIjTaB33Q8DpI&sensor=true"
        document.body.appendChild(script)

        context = {}
        Backbone.Validation.bind this
        $(@el).html(Handlebars.templates['tripOfferView'](context))
        $('.timepicker-default').timepicker({showMeridian: false, showSeconds: false, minuteStep: 5})

    createOnSubmit: ->
        from = $('#from').val()
        to = $('#to').val()
        timeArrival = $('#offer-arrival-time').val()
        timeDeparture = $('#offer-departure-time').val()

        @model.set({offerDestinationAddress: to, offerOriginAddress: from})

        @model.saveWithOriginAndDestination(from, to, (id) ->
            $('#offerAdded').modal()
            $("#offerAdded").on "hidden", ->
                    shuttledriveWeb.app.navigate 'tripoffer/' + id, {trigger: true}
        )
