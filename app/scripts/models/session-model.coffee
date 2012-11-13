class shuttledriveWeb.Models.Session extends Backbone.Model
    defaults:
        access_token: null,
        user_id: null,
        username: null,
        profilePicture: null

    initialize: ->
        @load()


    authenticated: ->
        Boolean(@get("access_token"))

    urlRoot: ->
        shuttledriveWeb.rootPath + '/login'

    # Saves session information to cookie
    saveCookie: (id, access_token, profilePicture, username) ->
        $.cookie('user_id', id)
        $.cookie('access_token', access_token)
        $.cookie('username', username)
        $.cookie('profilePicture', profilePicture)


    authUser: (token, callback) ->
        @fetch(
            headers:
                "Authorization": token
            success: (data) ->
                callback(data.get('id'), data.get('firstName')+" "+data.get('lastName'), data.get('profilePicture'))
            error: ->
                callback(-1)
        )

    deleteCookie: ->
        $.removeCookie('user_id')
        $.removeCookie('access_token')
        $.removeCookie('username')
        $.removeCookie('profilePicture')

    # Loads session information from cookie
    load: ->
        @set 'user_id', $.cookie('user_id')
        @set 'username', $.cookie('username')
        @set 'access_token', $.cookie('access_token')
        @set 'profilePicture', $.cookie('profilePicture')



