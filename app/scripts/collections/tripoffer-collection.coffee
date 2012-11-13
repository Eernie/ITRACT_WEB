class shuttledriveWeb.Collections.TripOfferCollection extends Backbone.Collection
    model: shuttledriveWeb.Models.TripOfferModel

    url: ->
        #id = new shuttledriveWeb.Models.Session().get 'user_id'
        id = 1
        shuttledriveWeb.rootPath + '/user/' + id + '/trip_offers'