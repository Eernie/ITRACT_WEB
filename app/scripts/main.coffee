window.shuttledrive =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    console.log "Hello from Backbone!"

$ ->
  shuttledrive.init()
  console.log shuttledrive
  Todos = new shuttledrive.Collections.TodoList()
  App = new shuttledrive.Views.AppView(Todos)

  return