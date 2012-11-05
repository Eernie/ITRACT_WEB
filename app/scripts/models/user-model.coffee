# shouldn't this be a collection?
class shuttledriveWeb.Models.UserModel extends Backbone.Model


    url: ->
        shuttledriveWeb.rootPath + '/user/' + @id
