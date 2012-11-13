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
        console.log @model.attributes.thumbUp
        if $('#thumbDown').attr('class') is 'clickOffDown'
            @model.attributes.thumbDown = @model.attributes.thumbDown - 1
            $('#thumbDownValue').html(@model.attributes.thumbDown)
            $('#thumbDown').toggleClass('clickOffDown clickOnDown')
        if @model.attributes.thumbUp
            @model.attributes.thumbUp = @model.attributes.thumbUp+1
        else
            @model.attributes.thumbUp = 1
        $('#thumbUpValue').html(@model.attributes.thumbUp)
        $(element.currentTarget).toggleClass('clickOnUp clickOffUp')
        
       
        
    thumbDown: (element) ->

        if $('#thumbUp').attr('class') is 'clickOffUp'
            @model.attributes.thumbUp = @model.attributes.thumbUp - 1
            $('#thumbUpValue').html(@model.attributes.thumbUp)
            $('#thumbUp').toggleClass('clickOffUp clickOnUp')
        if @model.attributes.thumbDown
            @model.attributes.thumbDown = @model.attributes.thumbDown+1
        else
            @model.attributes.thumbDown = 1
        $('#thumbDownValue').html(@model.attributes.thumbDown)
        $(element.currentTarget).toggleClass('clickOnDown clickOffDown')
