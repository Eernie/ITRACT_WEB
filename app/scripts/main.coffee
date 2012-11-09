window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    Helpers: {}
    rootPath: 'http://localhost:9000/api'
    init: ->
        new shuttledriveWeb.Views.MenuView()
        shuttledriveWeb.app = new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()