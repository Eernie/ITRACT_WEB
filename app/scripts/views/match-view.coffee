class shuttledriveWeb.Views.MatchView extends Backbone.View
	el: $ '.content'

	initialize: ->
		allMatches = new shuttledriveWeb.Collections.MatchCollection()
		all = allMatches.fetch()
		@render()

	render: ->
		