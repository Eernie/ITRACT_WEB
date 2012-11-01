class shuttledriveWeb.Views.TripRequestView extends Backbone.View
    model: shuttledriveWeb.Models.TripRequestModel

    initialize: ->
        console.log 'init TripRequestView'
        _.bindAll @, 'render'
        @model.bind 'change', @render
        @render()

    render: ->
        $(@el).html(Handlebars.templates['triprequestView'](@model.toJSON()))
        