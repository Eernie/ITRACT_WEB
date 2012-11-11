class shuttledriveWeb.Views.TripOverviewView extends Backbone.View
    el: $ '#content'

    templates:
        'nav_requests': 'tripRequestOverviewView'

    events:
        "click .nav a": "navigate"
        #"click .requestTab": "requestDetail"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        $(@el).html(Handlebars.templates['tripOverviewView'](context))

    navigate: (e) ->
        navigate = $(e.target).parent().attr 'id'
        if navigate is 'nav_requests'
            tripRequestCollection = new shuttledriveWeb.Collections.TripRequestCollection()
            tripRequestCollection.fetch
                success: ->
                    new shuttledriveWeb.Views.TripOverviewMiddleTabView({collection : tripRequestCollection, template : 'tripRequestOverviewView'})
        else if navigate is 'nav_offers'
            $('.tab-content').html(Handlebars.templates['tripRequestOverviewView']())
        else if navigate is 'nav_matches'
            $('.tab-content').html(Handlebars.templates['tripRequestOverviewView']())

    requestDetail: (e) ->
        console.log $(e.target).parent().attr 'id'
