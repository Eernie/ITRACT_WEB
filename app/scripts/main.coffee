window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    Helpers: {}
    rootPath: '/api'
    init: ->
        new shuttledriveWeb.Views.MenuView()
        console.log 'main'
        shuttledriveWeb.app = new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()

