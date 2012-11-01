class shuttledriveWeb.Views.ApplicationView extends Backbone.View
    el: $ '#content'

    events:
        "click #trip-request-submit": "createOnSubmit"

    initialize: ->
        _.bindAll(@)
        @render()

    render: ->
        context = {}
        $(@el).html(Handlebars.templates['applicationView'](context))
        $("#departure-start, #departure-end, #arrival-start, #arrival-end").timepicker({amPmText: ['', '']})

    # TODO: remove from view and into helper or model and unit test
    createDate: (timeString) ->
        time = timeString.split ':'
        date = new Date()
        date.setSeconds 0
        date.setHours time[0]
        date.setMinutes time[1]
        +date # convert to unix timestamp

    createOnSubmit: ->
        console.log "createOnSubmit"
        from = $('#from').val()
        to = $('#to').val()
        departureStart = @createDate $('#departure-start').val()
        departureEnd = @createDate $('#departure-end').val()
        arrivalStart = @createDate $('#arrival-start').val()
        arrivalEnd = @createDate $('#arrival-end').val()
        tripRequest = new shuttledriveWeb.Models.TripRequestModel({ startTimeMin: departureStart, startTimeMax: departureEnd, endTimeMin: arrivalStart, endTimeMax: arrivalEnd })
        tripRequest.fetchCoordinates from, to
        tripRequestView = new shuttledriveWeb.Views.TripRequestView({model: tripRequest})

        $('#trip-request-view').html(tripRequestView.render())
