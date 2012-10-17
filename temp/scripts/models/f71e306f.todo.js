(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  shuttledrive.Models.Todo = (function(_super) {

    __extends(Todo, _super);

    function Todo() {
      return Todo.__super__.constructor.apply(this, arguments);
    }

    Todo.prototype.defaults = {
      content: "empty todo...",
      done: false
    };

    Todo.prototype.initialize = function() {
      if (!this.get("content")) {
        return this.set({
          "content": this.defaults.content
        });
      }
    };

    Todo.prototype.toggle = function() {
      return this.save({
        done: !this.get("done")
      });
    };

    Todo.prototype.clear = function() {
      this.destroy();
      return this.view.remove();
    };

    return Todo;

  })(Backbone.Model);

}).call(this);
