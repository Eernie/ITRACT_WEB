class shuttledriveWeb.Views.TripRequestView extends Backbone.View
	model: shuttledriveWeb.Models.TripRequestModel

	initialize: ->
		_.bindAll @, 'render'
		@model.bind 'change', @render
		@render()

	render: ->
		template = Handlebars.compile($('#triprequest').html())
		$(@el).html(template(@model.toJSON()))
		