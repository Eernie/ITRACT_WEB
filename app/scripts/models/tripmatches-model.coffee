# shouldn't this be a collection?
class shuttledriveWeb.Models.TripMatchesModel extends Backbone.Model
    defaults:
        originAddress: ""
        destinationAddress: ""

    url: ->
        shuttledriveWeb.rootPath + '/match/' + @id




