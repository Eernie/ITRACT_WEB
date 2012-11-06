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
        @model.set({requestOriginAddress: from, requestDestinationAddress: to})
        @model.saveWithOriginAndDestination(from, to, (id) ->
            console.log 'show id'
            console.log id
            shuttledriveWeb.app.navigate 'triprequest/' + id, {trigger: true}
        )
        console.log(@model.isValid())