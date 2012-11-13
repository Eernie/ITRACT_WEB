class shuttledriveWeb.Models.UserProfileModel extends Backbone.Model


    url: ->
        shuttledriveWeb.rootPath + '/user/' + @id
