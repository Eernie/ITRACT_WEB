class shuttledriveWeb.Views.RegisterView extends Backbone.View
    el: $ '#content'

    events:
        "click #register-submit": "createOnSubmit"

    initialize: ->
        _.bindAll @
        @render()

    render: ->
        context = {}
        Backbone.Validation.bind this
        $(@el).html(Handlebars.templates['registerView'](context))

    createOnSubmit: ->
        console.log("tralala")
        email = $('#email').val()
        password = $('#password').val()
        firstname = $('#firstName').val()
        lastname = $('#lastName').val()
        telephoneNr = $('#telephoneNr').val()
        address = $('#address').val()
        postalCode = $('#postalCode').val()
        dateOfBirth = $('#dateOfBirth').val()
        gender = $('#city').val()

        @model.set({telephoneNr: telephoneNr, address: address, postalCode: postalCode, dateOfBirth: dateOfBirth, gender:gender, firstName:firstname, lastName: lastname, password:password, email:email, profilePicture: 'http://2.gravatar.com/avatar/0dff0f9ef3d64ea9bc03a755661886c9?size=420'})
        console.log(@model.isValid())
        @model.createUser((id) ->
            token = "Basic "+shuttledriveWeb.Helpers.EncodingHelper.toBase64(email+":"+password)
            session = new shuttledriveWeb.Models.Session()
            session.saveCookie(id, token)
            shuttledriveWeb.app.navigate 'tripoverview', {trigger: true}
        )


