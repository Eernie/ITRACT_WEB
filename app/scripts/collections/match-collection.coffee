class shuttledriveWeb.Collections.MatchCollection extends Backbone.Collection
    requestId: 0

    url: ->
        shuttledriveWeb.rootPath + '/match/' + @requestId

    initialize: (models, options) ->
        requestId = options.id
        @fetch
            success: (attrs) ->
                models = {}
                models.matches = []
                console.log attrs.get 0
                for matches in attrs.get(0).get('tripMatches')
                    models.matches.push(new shuttledriveWeb.Models.TripMatchModel(matches))
                models.request = new shuttledriveWeb.Models.TripRequestModel(attrs.get('tripRequest'))
                @model = models
                console.log @models
            error: (attrs, error) ->
                console.log attrs
                #
        
        console.log @