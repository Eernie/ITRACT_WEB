class shuttledriveWeb.Views.TripRequestListView extends Backbone.View

    events:
        "click .requestTab": "requestDetail"

    initialize: ->
        _.bindAll @, 'render'
        @render()

    render: ->
        tripRequestCollection = @options.collection
        template = @options.template
        context = {tripRequestCollection: tripRequestCollection.toJSON()}
        $(@el).html(Handlebars.templates[template](context))
        $(".requestTab:first").trigger('click')
        id = $(".requestTab:first").parent().attr('id').substring(8)
        @showRequest id

    requestDetail: (e) ->
        idString = $(e.target).parent().attr 'id'
        id = idString.substring(8)
        @showRequest id

    showRequest: (id) ->
        tripRequest = new shuttledriveWeb.Models.TripRequestModel { id : id }
        tripRequest.fetch
            success: ->
                new shuttledriveWeb.Views.TripRequestListItemView({tripRequest : tripRequest, template : 'tripRequestListItemView', el: $ '#right-tab-content'})