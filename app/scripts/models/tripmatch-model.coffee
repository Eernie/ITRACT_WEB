class shuttledriveWeb.Models.TripMatchesModel extends Backbone.Model
    defaults:
        originAddress: ""
        destinationAddress: ""

    url: ->
        'http://localhost:5000/match/'+@id




