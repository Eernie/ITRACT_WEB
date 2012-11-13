class shuttledriveWeb.Views.TripOfferListView extends Backbone.View

    events:
        "click .offerTab": "offerDetail"

    initialize: ->
        _.bindAll @, 'render'
        @render()

    render: ->
        tripOfferCollection = @options.collection
        template = @options.template
        context = {tripOfferCollection: tripOfferCollection.toJSON()}
        $(@el).html(Handlebars.templates[template](context))
        $(".offerTab:first").trigger('click')
        id = $(".offerTab:first").parent().attr('id').substring(6)
        @showOffer id

    offerDetail: (e) ->
        idString = $(e.target).parent().attr 'id'
        id = idString.substring(6)
        @showOffer id

    showOffer: (id) ->
        tripOffer = new shuttledriveWeb.Models.TripOfferModel { id : id }
        tripOffer.fetch
            success: ->
                new shuttledriveWeb.Views.TripOfferListItemView({tripOffer : tripOffer, template : 'tripOfferListItemView', el: $ '#right-tab-content'})