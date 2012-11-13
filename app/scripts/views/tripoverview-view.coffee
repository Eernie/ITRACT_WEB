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
        @showRequestsList()

    navigate: (e) ->
        navigate = $(e.target).parent().attr 'id'
        if navigate is 'nav_requests'
            @showRequestsList()
        else if navigate is 'nav_offers'
            @showOffersList()

    showRequestsList: ->
        tripRequestCollection = new shuttledriveWeb.Collections.TripRequestCollection()
        tripRequestCollection.fetch
            success: ->
                new shuttledriveWeb.Views.TripRequestListView({collection : tripRequestCollection, template : 'tripRequestOverviewView', el: $ '#middle-tab-content'})
            error: ->
                alert 'An error has occurred fetching the results of your trip requests'

    showOffersList: ->
        tripOfferCollection = new shuttledriveWeb.Collections.TripOfferCollection()
        tripOfferCollection.fetch
            success: ->
                new shuttledriveWeb.Views.TripOfferListView({collection : tripOfferCollection, template : 'tripOfferOverviewView', el: $ '#middle-tab-content'})
            error: ->
                alert 'An error has occurred fetching the results of your trip offers'

    requestDetail: (e) ->
        console.log $(e.target).parent().attr 'id'
