class shuttledriveWeb.Models.NotificationModel extends Backbone.Model

    initialize: ->
        if @get('state') < 3
            @set('serverNeedsResponse', true)

    url: ->
        shuttledriveWeb.rootPath + '/notification/' + @id

    updateStatusAccept: ->
        match = new shuttledriveWeb.Models.TripMatchModel @get('tripMatch')
        return unless match.get('state') is 1 or match.get('state') is 2 # make sure the state can only be set when it's 1 or 2
        if match.get('state') is 1 then match.set('state', 2) else match.set('state', 4)
        match.save()
        #send stuff to server

    updateStatusDecline: ->
        match = new shuttledriveWeb.Models.TripMatchModel @get('tripMatch')
        return unless match.get('state') is 1 or match.get('state') is 2 # make sure the state can only be set when it's 1 or 2
        if match.get('state') is 1 then match.set('state', 3) else match.set('state', 5)
        match.save()
        # send stuff to server

    # override sync to include the authorization headers
    sync: (method, model, options)->
            options.headers = "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
            Backbone.sync(method, model, options)

