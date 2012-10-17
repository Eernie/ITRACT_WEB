(function() {

  window.shuttledrive = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    init: function() {
      return console.log("Hello from Backbone!");
    }
  };

  $(function() {
    var App, Todos;
    shuttledrive.init();
    console.log(shuttledrive);
    Todos = new shuttledrive.Collections.TodoList();
    App = new shuttledrive.Views.AppView(Todos);
  });

}).call(this);
