window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    rootPath: 'http://localhost:5000'
    init: ->
        new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()