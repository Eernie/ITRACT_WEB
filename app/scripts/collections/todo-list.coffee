class shuttledrive.Collections.TodoList extends Backbone.Collection

    # Reference to this collection's model.
    model: shuttledrive.Models.Todo

    # Attribute getter/setter
    getDone = (todo) ->
        return todo.get("done")

    # Filter down the list of all todo items that are finished.
    done: ->
        return @filter( getDone )

    # Filter down the list to only todo items that are still not finished.
    remaining: ->
        return @without.apply(this, @done())

    # We keep the Todos in sequential order, despite being saved by unordered
    # GUID in the database. This generates the next order number for new items.
    nextOrder: ->
        return 1 if !@length
        return @last().get('order') + 1

    # Todos are sorted by their original insertion order.
    comparator: (todo) ->
        return todo.get("order")

### Todo Item View ###