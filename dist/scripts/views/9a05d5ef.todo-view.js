(function() {
  var TodoView,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  TodoView = (function(_super) {

    __extends(TodoView, _super);

    function TodoView() {
      this.updateOnEnter = __bind(this.updateOnEnter, this);

      this.close = __bind(this.close, this);

      this.edit = __bind(this.edit, this);

      this.render = __bind(this.render, this);
      return TodoView.__super__.constructor.apply(this, arguments);
    }

    TodoView.prototype.tagName = "li";

    TodoView.prototype.template = Handlebars.templates['todo'];

    TodoView.prototype.events = {
      "click .check": "toggleDone",
      "dblclick div.todo-content": "edit",
      "click span.todo-destroy": "clear",
      "keypress .todo-input": "updateOnEnter"
    };

    TodoView.prototype.initialize = function() {
      this.model.bind('change', this.render);
      return this.model.view = this;
    };

    TodoView.prototype.render = function() {
      this.$(this.el).html(this.template(this.model.toJSON()));
      console.log(this.model.toJSON());
      this.setContent();
      return this;
    };

    TodoView.prototype.setContent = function() {
      var content;
      content = this.model.get("content");
      this.$(".todo-content").text(content);
      this.input = this.$(".todo-input");
      this.input.bind("blur", this.close);
      return this.input.val(content);
    };

    TodoView.prototype.toggleDone = function() {
      return this.model.toggle();
    };

    TodoView.prototype.edit = function() {
      this.$(this.el).addClass("editing");
      return this.input.focus();
    };

    TodoView.prototype.close = function() {
      this.model.save({
        content: this.input.val()
      });
      return $(this.el).removeClass("editing");
    };

    TodoView.prototype.updateOnEnter = function(e) {
      if (e.keyCode === 13) {
        return this.close();
      }
    };

    TodoView.prototype.remove = function() {
      return $(this.el).remove();
    };

    TodoView.prototype.clear = function() {
      return this.model.clear();
    };

    return TodoView;

  })(Backbone.View);

}).call(this);
