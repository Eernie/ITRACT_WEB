class shuttledriveWeb.Models.TripMatchesModel extends Backbone.Model
    defaults:
        originAddress: ""
        destinationAddress: ""

    url: ->
        shuttledriveWeb.rootPath + '/match/' + @id



