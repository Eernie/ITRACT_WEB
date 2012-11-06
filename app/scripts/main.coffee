window.shuttledriveWeb =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    Helpers: {}
    rootPath: 'http://145.33.225.224:8080'
    init: ->
    	shuttledriveWeb.app = new shuttledriveWeb.Routers.ApplicationRouter()
    	Backbone.history.start()
    
$(document).ready ->
    shuttledriveWeb.init()