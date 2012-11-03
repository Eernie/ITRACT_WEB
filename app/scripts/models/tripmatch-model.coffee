class shuttledriveWeb.Models.TripMatchModel extends Backbone.Model
    defaults:
        originAddress: ""
        destinationAddress: ""
        matchState: ""
        confirm: "" 

    url: ->
        shuttledriveWeb.rootPath + '/trip_match/' + @id