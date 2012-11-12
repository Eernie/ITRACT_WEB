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
                    new shuttledriveWeb.Views.TripRequestListView({collection : tripRequestCollection, template : 'tripRequestOverviewView', el: $ '#middle-tab-content'})
                error: ->
                    alert 'An error has occurt fetching the results of your trip requests'
        else if navigate is 'nav_offers'
            tripOfferCollection = new shuttledriveWeb.Collections.TripOfferCollection()
            tripOfferCollection.fetch
                success: ->
                    new shuttledriveWeb.Views.TripOfferListView({collection : tripOfferCollection, template : 'tripRequestOverviewView', el: $ '#middle-tab-content'})
                error: ->
                    alert 'An error has occurt fetching the results of your trip offers'
        else if navigate is 'nav_matches'
            $('.tab-content').html(Handlebars.templates['tripRequestOverviewView']())

    requestDetail: (e) ->
        console.log $(e.target).parent().attr 'id'
