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
            $('#offerAdded').modal()
            $("#offerAdded").on "hidden", ->
                shuttledriveWeb.app.navigate 'tripoverview/', {trigger: true}
        )
