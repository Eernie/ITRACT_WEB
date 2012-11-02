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
        $('.timepicker-default').timepicker({showMeridian: false, showSeconds: false})

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
        ###
        dep_start = @createDate $('#departure_start').val()
        dep_end = @createDate $('#departure_end').val()
        arr_start = @createDate $('#arrival_start').val()
        arr_end = @createDate $('#arrival_end').val()
        ###
        tripRequest = new shuttledriveWeb.Models.TripRequestModel()
        ###
        {start_time_min: dep_start, start_time_max: dep_end, end_time_min: arr_start, end_time_max: arr_end})
        ###
        tripRequest.fetchCoordinates from, to
        tripRequestView = new shuttledriveWeb.Views.TripRequestView({model: tripRequest})

        $('#trip-request-view').html(tripRequestView.render())

        tripRequest.save(
            tripRequest.toJSON()
        ,
            success: ->
                match = new shuttledriveWeb.Models.TripMatchesModel({id: tripRequest.get('request_id')})
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

