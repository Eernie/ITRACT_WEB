class shuttledriveWeb.Views.ApplicationView extends Backbone.View
	el: $ '.application'

	events:
  		"click #trip-request-submit": "createOnSubmit"

  	initialize: ->
  		_.bindAll(@)
  		@render()

	render: ->
		template = Handlebars.compile($('#template').html())
		context = {content: ' CHEERIO MATE!'}
		$(@el).html(template(context))

	createOnSubmit: ->
		console.log "createOnSubmit"
		from = $('#from').val()
		to = $('#to').val()
		tripRequest = new shuttledriveWeb.Models.TripRequestModel from, to
		tripRequestView = new shuttledriveWeb.Views.TripRequestView({model: tripRequest})
		console.log tripRequestView
		$('#trip-request-view').html(tripRequestView.render())
