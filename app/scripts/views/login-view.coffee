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
        user = $('#username').val()
        password = $('#password').val()
        token = "Basic "+shuttledriveWeb.Helpers.EncodingHelper.toBase64(user+":"+password)
        session = new shuttledriveWeb.Models.Session()
        session.authUser(token, (id) ->
            if id is -1
                $('#error').text("Login failed")
                @showError
            else
                session.saveCookie(id, token)
                session = new shuttledriveWeb.Models.Session()
                shuttledriveWeb.app.navigate 'triprequest', {trigger: true}
        )

    showError: ->
        $('#loginFailed').modal()
