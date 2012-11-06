class shuttledriveWeb.Views.TripOfferView extends Backbone.View
    el: $ '#content'

    events:
        "click #trip-offer-submit": "createOnSubmit"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        $(@el).html(Handlebars.templates['tripOfferView'](context))
        $('.timepicker-default').timepicker({showMeridian: false, showSeconds: false, minuteStep: 5})

    createOnSubmit: ->
        from = $('#from').val()
        to = $('#to').val()
        tripOffer = new shuttledriveWeb.Models.TripOfferModel()
        tripOffer.saveWithOriginAndDestination(from, to, (id) ->
            $('#offerAdded').modal()
            #shuttledriveWeb.app.navigate 'tripoffer/' + id, {trigger: true}
        )