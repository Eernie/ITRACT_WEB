class shuttledriveWeb.Views.TripOverviewMiddleTabView extends Backbone.View
    el: $ '#middle-tab-content'

    initialize: ->
        @el = $ '#middle-tab-content'
        _.bindAll @, 'render'
        @options.collection.bind 'reset', @render()

    render: ->
        tripRequestCollection = this.options.collection
        template = this.options.template
        context = {tripRequestCollection: tripRequestCollection.toJSON()}
        console.log tripRequestCollection
        $(@el).html(Handlebars.templates['tripRequestOverviewView'](context))

    navigate: (e) ->
        navigate = $(e.target).parent().attr 'id'
        if navigate is 'nav_requests'
            tripRequestCollection = new shuttledriveWeb.Collections.TripRequestCollection()
            tripRequestCollection.fetch
                success: ->
                    context = {tripRequestCollection: tripRequestCollection.toJSON()}
                    $('.middle-tab-content').html(Handlebars.templates['tripRequestOverviewView'](context))
                error: ->
                    console.log 'error'
        else if navigate is 'nav_offers'
            $('.tab-content').html(Handlebars.templates['tripRequestOverviewView']())
        else if navigate is 'nav_matches'
            $('.tab-content').html(Handlebars.templates['tripRequestOverviewView']())

    requestDetail: (e) ->
        console.log $(e.target).parent().attr 'id'
