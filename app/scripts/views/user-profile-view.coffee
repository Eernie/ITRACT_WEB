class shuttledriveWeb.Views.UserProfileView extends Backbone.View
    events:
        "click .clickOnUp":  "thumbUp"
        "click .clickOnDown":  "thumbDown"

    render:  ->
        context = {
            'user': @model.attributes
        }
        $(@el).html(Handlebars.templates['userProfileView'](context))


    thumbUp: (element) ->
        if $('#thumbDown').attr('class') is 'clickOffDown'
            hasSchwitchedThumbup = true
            @model.attributes.negative = @model.attributes.negative - 1
        if @model.attributes.positive
            @model.attributes.positive = @model.attributes.positive+1
        else
            @model.attributes.positive = 1
        @model.save(
            @model.toJSON # only to save it again here, while we already fetched the model in the router
            ,
            success:->
                if hasSchwitchedThumbUp
                    $('#thumbDownValue').html(@model.attributes.negative)
                    $('#thumbDown').toggleClass('clickOffDown clickOnDown')
                $('#thumbUpValue').html(@model.attributes.positive)
                $(element.currentTarget).toggleClass('clickOnUp clickOffUp')
            error:->
            #
        )    

    thumbDown: (element) ->
        if $('#thumbUp').attr('class') is 'clickOffUp'
            @model.attributes.positive = @model.attributes.positive - 1
            hasSchwitchedThumbDown = true
        if @model.attributes.negative
            @model.attributes.negative = @model.attributes.negative+1
        else
            @model.attributes.negative = 1
        @model.save(
            @model.toJSON # only to save it again here, while we already fetched the model in the router
            ,
            success:->
                if hasSchwitchedThumbDown
                    $('#thumbUpValue').html(@model.attributes.positive)
                    $('#thumbUp').toggleClass('clickOffUp clickOnUp')
                $('#thumbDownValue').html(@model.attributes.negative)
                $(element.currentTarget).toggleClass('clickOnDown clickOffDown')
            error:->
                #
        )