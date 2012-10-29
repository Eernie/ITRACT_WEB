window.shuttledriveWeb =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    console.log "Hello from Backbone!"

$(document).ready ->
  shuttledriveWeb.init()
  view = new shuttledriveWeb.Views.ApplicationView()
