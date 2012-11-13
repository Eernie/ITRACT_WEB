class shuttledriveWeb.Views.TripOfferListItemView extends Backbone.View

    initialize: ->
        _.bindAll @, 'render'
        @render()

    render: ->
        tripOffer = @options.tripOffer
        template = @options.template
        context = {tripOffer: tripOffer.toJSON()}
        $(@el).html(Handlebars.templates[template](context))
        $(".user-popover").popover({trigger : 'hover'})