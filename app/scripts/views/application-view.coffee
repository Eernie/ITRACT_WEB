class shuttledriveWeb.Views.ApplicationView extends Backbone.View
  # template: application
  initialize: ->
  	@render()

  render: ->
  	template = Handlebars.compile('#template').html()
  	context = [{content: 'CHEERIO MATE!'}]
  	@el.html(template(context))
