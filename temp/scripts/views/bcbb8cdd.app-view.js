(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  shuttledrive.Views.AppView = (function(_super) {
    var el_tag;

    __extends(AppView, _super);

    function AppView(todos) {
      this.addAll = __bind(this.addAll, this);

      this.addOne = __bind(this.addOne, this);

      this.render = __bind(this.render, this);

      this.initialize = __bind(this.initialize, this);
      this.todos = todos;
    }

    el_tag = "#todoapp";

    AppView.prototype.el = $(el_tag);

    AppView.prototype.statsTemplate = _.template($("#stats-template").html());

    AppView.prototype.events = {
      "keypress #new-todo": "createOnEnter",
      "keyup #new-todo": "showTooltip",
      "click .todo-clear a": "clearCompleted"
    };

    AppView.prototype.initialize = function() {
      this.input = this.$("#new-todo");
      this.todos.bind("add", this.addOne);
      this.todos.bind("reset", this.addAll);
      this.todos.bind("all", this.render);
      return Todos.fetch();
    };

    AppView.prototype.render = function() {
      return this.$('#todo-stats').html(this.statsTemplate({
        total: Todos.length,
        done: Todos.done().length,
        remaining: Todos.remaining().length
      }));
    };

    AppView.prototype.addOne = function(todo) {
      var view;
      view = new TodoView({
        model: todo
      });
      return this.$("#todo-list").append(view.render().el);
    };

    AppView.prototype.addAll = function() {
      return Todos.each(this.addOne);
    };

    AppView.prototype.newAttributes = function() {
      return {
        content: this.input.val(),
        order: Todos.nextOrder(),
        done: false
      };
    };

    AppView.prototype.createOnEnter = function(e) {
      if (e.keyCode !== 13) {
        return;
      }
      Todos.create(this.newAttributes());
      return this.input.val('');
    };

    AppView.prototype.clearCompleted = function() {
      _.each(Todos.done(), function(todo) {
        return todo.clear();
      });
      return false;
    };

    AppView.prototype.showTooltip = function(e) {
      var show, tooltip, val;
      tooltip = this.$(".ui-tooltip-top");
      val = this.input.val();
      tooltip.fadeOut();
      if (this.tooltipTimeout) {
        clearTimeout(this.tooltipTimeout);
      }
      if (val === '' || val === this.input.attr("placeholder")) {
        return;
      }
      show = function() {
        return tooltip.show().fadeIn();
      };
      return this.tooltipTimeout = _.delay(show, 1000);
    };

    return AppView;

  })(Backbone.View);

}).call(this);
