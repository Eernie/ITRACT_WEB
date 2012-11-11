class shuttledriveWeb.Views.TripOverviewMiddleTabView extends Backbone.View
    el: $ '#middle-tab-content'

    events:
        "click .requestTab": "modelDetail"

    initialize: ->
        @el = $ '#middle-tab-content'
        _.bindAll @, 'render'
        @render()

    render: ->
        tripRequestCollection = @options.collection
        template = @options.template
        context = {tripRequestCollection: tripRequestCollection.toJSON()}
        $(@el).html(Handlebars.templates[template](context))

    modelDetail: (e) ->
        console.log 'wat'
        console.log $(e.target).parent().attr 'id'
