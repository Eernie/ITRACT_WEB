class shuttledriveWeb.Models.Session extends Backbone.Model
    defaults:
        access_token: null,
        user_id: null,

    initialize: ->
        @load()


    authenticated: ->
        Boolean(@get("access_token"))

    urlRoot: ->
        shuttledriveWeb.rootPath + '/login'

    # Saves session information to cookie
    saveCookie: (id, access_token) ->
        $.cookie('user_id', id)
        $.cookie('access_token', access_token)


    authUser: (token, callback) ->
        @fetch(
            headers:
                "Authorization": token
            success: (data) ->
                callback(data.get('id'))
            error: ->
                callback(-1)
        )

    deleteCookie: ->
        $.removeCookie('user_id')
        $.removeCookie('access_token')

    # Loads session information from cookie
    load: ->
        @.set 'user_id' : $.cookie('user_id')
        @.set 'access_token' : $.cookie('access_token')




