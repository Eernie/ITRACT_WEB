window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    Helpers: {}
    init: ->
        shuttledriveWeb.rootPath = @getRootPath()
        new shuttledriveWeb.Views.MenuView()
        console.log 'main'
        shuttledriveWeb.app = new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()

    getRootPath: ->
        console.log document.location.hostname
        if document.location.hostname is not 'localhost:3501'
            return '/api'
        else
            return 'http://localhost:9000/api'

    
$(document).ready ->
    shuttledriveWeb.init()

