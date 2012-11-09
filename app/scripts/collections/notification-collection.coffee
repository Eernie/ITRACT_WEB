class shuttledriveWeb.Collections.NotificationCollection extends Backbone.Collection
    construct: (@models, @options) ->
    @model: shuttledriveWeb.Models.NotificationModel
    url: ->
        shuttledriveWeb.rootPath + '/notification'

    initialize:  ->
        @fetch()