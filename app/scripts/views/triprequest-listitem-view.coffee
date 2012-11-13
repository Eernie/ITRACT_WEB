class shuttledriveWeb.Views.TripRequestListItemView extends Backbone.View

    initialize: ->
        _.bindAll @, 'render'
        @render()

    render: ->
        tripRequest = @options.tripRequest
        template = @options.template
        context = {tripRequest: tripRequest.toJSON()}
        $(@el).html(Handlebars.templates[template](context))
        $(".user-popover").popover({trigger : 'hover'})