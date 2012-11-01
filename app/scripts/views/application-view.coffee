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

    createOnSubmit: ->
        from = $('#from').val()
        to = $('#to').val()
        console.log to
        tripRequest = new shuttledriveWeb.Models.TripRequestModel()
        tripRequest.fetchCoordinates from, to
        tripRequestView = new shuttledriveWeb.Views.TripRequestView({model: tripRequest})
        console.log tripRequestView

        $('#trip-request-view').html(tripRequestView.render())

