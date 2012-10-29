class shuttledriveWeb.Views.ApplicationView extends Backbone.View
	el: $ '.content'

	initialize: ->
  	console.log 'initialize'
  	@render()

  render: ->
  		
  	context = {}
  	$(@el).html(Handlebars.templates['applicationView'](context))