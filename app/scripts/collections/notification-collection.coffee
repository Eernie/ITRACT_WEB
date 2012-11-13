class shuttledriveWeb.Collections.NotificationCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.NotificationModel
    
    url: ->
        shuttledriveWeb.rootPath + '/notification'

    initialize:  ->
        @fetch()