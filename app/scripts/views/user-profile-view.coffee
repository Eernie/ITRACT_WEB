class shuttledriveWeb.Views.UserProfileView extends Backbone.View
    events:
        "click .clickOnUp":  "thumbUp"
        "click .clickOnDown":  "thumbDown"

    render:  ->
        context = {
            'user': @model.attributes
        }
        $(@el).html(Handlebars.templates['userProfileView'](context))
        

    # getRating: ->
    #     $('#thumbUpValue').html(@model.attributes.positive)
    #     $('#thumbDownValue').html(@model.attributes.negative)

    thumbUp: (element) ->
        hasSchwitchedThumbup = false
        if $('#thumbDown').attr('class') is 'clickOffDown'
            @model.attributes.negative = @model.attributes.negative - 1
            hasSchwitchedThumbup = true
        if @model.attributes.positive
            @model.attributes.positive = @model.attributes.positive+1
        else
            @model.attributes.positive = 1
        @model.save(
            {},
            headers:
                "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
            success:=>
                if hasSchwitchedThumbup
                    console.log 'down on'
                    $('#thumbDownValue').html(@model.attributes.negative)
                    $('#thumbDown').toggleClass('clickOffDown clickOnDown')
                $('#thumbUpValue').html(@model.attributes.positive)
                $(element.currentTarget).toggleClass('clickOnUp clickOffUp')
            error:=>
                console.log 'error'
            #
        )    

    thumbDown: (element) ->
        hasSchwitchedThumbDown = false
        if $('#thumbUp').attr('class') is 'clickOffUp'
            @model.attributes.positive = @model.attributes.positive - 1
            hasSchwitchedThumbDown = true
        if @model.attributes.negative
            @model.attributes.negative = @model.attributes.negative + 1
        else
            @model.attributes.negative = 1
        @model.save(
            {}
            headers:
                "Authorization": new shuttledriveWeb.Models.Session().get('access_token')
            success:=>
                if hasSchwitchedThumbDown
                    console.log 'been here '
                    $('#thumbUpValue').html(@model.attributes.positive)
                    $('#thumbUp').toggleClass('clickOffUp clickOnUp')
                $('#thumbDownValue').html(@model.attributes.negative)
                $(element.currentTarget).toggleClass('clickOnDown clickOffDown')
            error:=>
                console.log 'error'
                #
        )