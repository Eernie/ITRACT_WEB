console.log 'main'
window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    init: ->
        console.log 'init main'
        new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()
    console.log shuttledriveWeb