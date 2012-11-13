window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    Helpers: {}
    init: ->
        shuttledriveWeb.rootPath = @getRootPath()
        shuttledriveWeb.menu = new shuttledriveWeb.Views.MenuView()
        console.log 'main'
        shuttledriveWeb.app = new shuttledriveWeb.Routers.ApplicationRouter()
        Backbone.history.start()

    # determine the correct rootPath, in development we're hosting the API on localhost
    getRootPath: ->
        console.log document.location.hostname
        if document.location.hostname isnt 'localhost'
            return '/api'
        else
            return 'http://localhost:9000/api'

    
$(document).ready ->
    shuttledriveWeb.init()

