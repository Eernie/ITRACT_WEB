class shuttledriveWeb.Collections.NotificationCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.NotificationModel      
    
    url: ->
        shuttledriveWeb.rootPath + '/notification'

    initialize:  ->
        @fetch()
            

    fetch: ->
        Backbone.Collection.prototype.fetch.call @,
            headers:
                "Authorization": new shuttledriveWeb.Models.Session().get('access_token')

