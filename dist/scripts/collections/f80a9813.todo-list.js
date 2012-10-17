(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  shuttledrive.Collections.TodoList = (function(_super) {
    var getDone;

    __extends(TodoList, _super);

    function TodoList() {
      return TodoList.__super__.constructor.apply(this, arguments);
    }

    TodoList.prototype.model = shuttledrive.Models.Todo;

    getDone = function(todo) {
      return todo.get("done");
    };

    TodoList.prototype.done = function() {
      return this.filter(getDone);
    };

    TodoList.prototype.remaining = function() {
      return this.without.apply(this, this.done());
    };

    TodoList.prototype.nextOrder = function() {
      if (!this.length) {
        return 1;
      }
      return this.last().get('order') + 1;
    };

    TodoList.prototype.comparator = function(todo) {
      return todo.get("order");
    };

    return TodoList;

  })(Backbone.Collection);

  /* Todo Item View
  */


}).call(this);
