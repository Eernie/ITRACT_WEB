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

        arrivalTimeRadio = $('#arrival-time').attr('checked')
        departureTimeRadio = $('#departure-time').attr('checked')

        # if arrivalTimeRadio
        #     #arrivalTimeMin = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     #departureTimeMin = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     arrivalTimeMax = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     # @model.set({requestEndTimeMax: arrivalTimeMax})
        #     #departureTimeMax = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        # if departureTimeRadio
        #     #arrivalTimeMin = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     #arrivalTimeMax = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     departureTimeMin = shuttledriveWeb.Helpers.TimeHelper.getDate(time)
        #     # @model.set({requestStartTimeMin: departureTimeMin})
        #     #departureTimeMax = shuttledriveWeb.Helpers.TimeHelper.getDate(time)

        @model.set({requestDestinationAddress: to, requestOriginAddress: from})

        @model.saveWithOriginAndDestination(from, to, (id) ->
            shuttledriveWeb.app.navigate 'triprequest/' + id, {trigger: true}
        )