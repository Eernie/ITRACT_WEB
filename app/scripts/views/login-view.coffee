class shuttledriveWeb.Views.LoginView extends Backbone.View
    el: $ '#content'

    events:
        "click #login-submit": "createOnSubmit"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        $(@el).html(Handlebars.templates['loginView'](context))

    createOnSubmit: ->
        shuttledriveWeb.app.navigate 'triprequest/'
