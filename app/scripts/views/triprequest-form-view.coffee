class shuttledriveWeb.Views.TripRequestFormView extends Backbone.View
    el: $ '#content'


    events:
        "click #trip-request-submit": "createOnSubmit"

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

        console.log(time)
        console.log($('#time').val())

        radioDeparture = $('#departure-time').attr('checked')
        radioArrival = $('#arrival-time').attr('checked')
        console.log(radioArrival)
        console.log(radioDeparture)

        if radioDeparture is 'checked'
            console.log("send departuretime")
            @model.set({originAddress: from, destinationAddress: to, startTimeMin: shuttledriveWeb.Helpers.TimeHelper.getDate(time), startTimeMax: shuttledriveWeb.Helpers.TimeHelper.addHour(time, 3) })
        if radioArrival is 'checked'
            console.log("send arrivaltime")
            @model.set({originAddress: from, destinationAddress: to, endTimeMax: time, endTimeMin: shuttledriveWeb.Helpers.TimeHelper.removeHour(time, 3)})



        @model.saveWithOriginAndDestination(from, to, (id) ->
            shuttledriveWeb.app.navigate 'triprequest/' + id, {trigger: true}
        )

