class shuttledriveWeb.Views.TripOfferView extends Backbone.View
    el: $ '#content'

    events:
        "click #trip-offer-submit": "createOnSubmit"

    initialize: ->
        _.bindAll @
        @render()

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

        departureTimeMin = shuttledriveWeb.Helpers.TimeHelper.getDate(timeDeparture)
        arrivalTimeMax = shuttledriveWeb.Helpers.TimeHelper.getDate(timeArrival)


        @model.set({offerDestinationAddress: to, offerOriginAddress: from, startTimeMin: departureTimeMin, endTimeMax: arrivalTimeMax })
        @model.saveWithOriginAndDestination(from, to, (id) ->
            $('#offerAdded').modal()
            $("#offerAdded").on "hidden", ->
                    shuttledriveWeb.app.navigate 'tripoffer/' + id, {trigger: true}
        )
