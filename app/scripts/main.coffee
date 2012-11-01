window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    init: ->
        new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()