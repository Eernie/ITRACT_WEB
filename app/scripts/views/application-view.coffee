class shuttledriveWeb.Views.ApplicationView extends Backbone.View
    el: $ '#content'

    events:
        "click #trip-request-submit": "createOnSubmit"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        $(@el).html(Handlebars.templates['applicationView'](context))
        $('.timepicker-default').timepicker({showMeridian: false, showSeconds: false, minuteStep: 5})

    # TODO: remove from view and into helper or model and unit test
    createDate: (timeString) ->
        time = timeString.split ':'
        date = new Date()
        date.setSeconds 0
        date.setHours time[0]
        date.setMinutes time[1]
        +date # convert to unix timestamp

    createOnSubmit: ->
        from = $('#from').val()
        to = $('#to').val()
        tripRequest = new shuttledriveWeb.Models.TripRequestModel()
        tripRequest.fetchCoordinates from, to
        tripRequestView = new shuttledriveWeb.Views.TripRequestView({model: tripRequest})

        $('#trip-request-view').html(tripRequestView.render())

        tripRequest.save(
            tripRequest.toJSON()
        ,
            success: ->
                match = new shuttledriveWeb.Models.TripMatchesModel({id: tripRequest.get('requestId')})
                match.fetch
                    success: (data) ->
                        view = new shuttledriveWeb.Views.MatchView({model: data})
                        $('#trip-matches').html(view.render())
                    error: (data,error) ->
                        console.log error
                        console.log 'fail'
            fail: (error) ->
                console.log "Failed"
                console.log error
        )
