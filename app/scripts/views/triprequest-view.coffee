class shuttledriveWeb.Views.TripRequestView extends Backbone.View
	model: shuttledriveWeb.Models.TripRequestModel

	initialize: ->
		_.bindAll @, 'render'
		@model.bind 'change', @render
		@render()

	render: ->
		console.log Handlebars.templates['triprequestView'](@model.toJSON())
		$(@el).html(Handlebars.templates['triprequestView'](@model.toJSON()))
		