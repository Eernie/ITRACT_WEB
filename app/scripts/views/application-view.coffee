class shuttledriveWeb.Views.ApplicationView extends Backbone.View
	el: $ '.cheerio'

	initialize: ->
  	console.log 'initialize'
  	@render()

  render: ->
  	template = Handlebars.compile($('#template').html())
  	context = {content: ' CHEERIO MATE!'}
  	console.log template(context)
  	$(@el).html(template(context))
