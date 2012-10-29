window.shuttledriveWeb =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    console.log "Hello from Backbone!"

$(document).ready ->
  shuttledriveWeb.init()
  applicationView = new shuttledriveWeb.Views.ApplicationView()