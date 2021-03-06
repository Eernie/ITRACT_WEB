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
        profilePicture = $('#profilePicture').val()

        @model.set({ 
            telephoneNr: telephoneNr, 
            address: address, 
            postalCode: postalCode, 
            dateOfBirth: dateOfBirth, 
            gender:gender, 
            firstName:firstname, 
            lastName: lastname, 
            password:password, 
            email:email, 
            profilePicture: profilePicture
            })
        @model.createUser((id, username, profilePicture) ->
            token = "Basic "+shuttledriveWeb.Helpers.EncodingHelper.toBase64(email+":"+password)
            session = new shuttledriveWeb.Models.Session()
            session.saveCookie(id, token, profilePicture, username)
            shuttledriveWeb.app.navigate '', {trigger: true}
        )


