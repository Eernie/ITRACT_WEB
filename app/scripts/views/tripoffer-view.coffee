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
                
        point = new google.maps.LatLng(valueLat, valueLong)
        geocoder = new google.maps.Geocoder()
        geocoder.geocode
            latLng: point
        , (results, status) ->
            $('#from').attr("value", results[0].formatted_address)
            
    render: ->
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
