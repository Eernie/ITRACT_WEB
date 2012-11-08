class shuttledriveWeb.Models.TripMatchModel extends Backbone.Model

    url: ->
        shuttledriveWeb.rootPath + '/trip_match/' + @id
