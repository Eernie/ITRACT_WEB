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

        @save(@toJSON(),
            success: ->
                callback(@get('userId'))
            error: ->
                console.log 'error'
                callback('2')
        )



    # Loads session information from cookie
    load: ->
        @.set 'user_id' : $.cookie('user_id')
        @.set 'access_token' : $.cookie('access_token')

        @overrideSync() if @.get('access_token')?

    overrideSync: ->
        sync = Backbone.sync
        Backbone.sync = (method, model, options) ->
            options.beforeSend = (xhr) ->
                xhr.setRequestHeader "Authorization", @access_token

            sync method, model, options
