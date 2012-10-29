class shuttledriveWeb.Routers.ApplicationRouter extends Backbone.Router
	routes: 
		"matches": "matchesRoute"

	matchesRoute: ->
		view = new shuttledriveWeb.Views.MatchView()
		return