class shuttledriveWeb.Models.UserModel extends Backbone.Model
    ###
    firstName
    middleName
    lastName
    email
    password
    telephoneNr
    address
    postalCode
    city
    countryCode
    dateOfBirth
    gender
    ###


    url: ->
        shuttledriveWeb.rootPath + '/user'


    validation:
        firstName:
            required: true
            msg: 'Please enter your first name'
        lastName:
            required: true
            msg: 'Please enter your last name'
        password:
            required: true
            msg: 'Please enter your password'
        email:
            required: true
            pattern: 'email'
            msg: 'Please enter a correct email address'
        profilePicture:
            required: true
            msg: 'Please upload a profile picture'



    createUser: (callback) ->
        if @isValid()
            @save(@.toJSON(),
                success: (data) ->
                    callback(data.get('id'), data.get('firstName')+" "+data.get('lastName'), data.get('profilePicture'))
                error: ->
                    console.log 'error'
            )
        else
            console.log 'error'
