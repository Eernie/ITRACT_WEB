shuttledriveWeb.Helpers.TimeHelper =
    formatUnixTimestamp: (date) ->
        return Math.round(date.getTime() / 1000)

    createDate: (timeString) ->
        time = timeString.split ':'
        date = new Date()
        date.setSeconds 0
        date.setHours time[0]
        date.setMinutes time[1]
        date

    getDate: (timeString) ->
        date = @createDate(timeString)
        @formatUnixTimestamp(date)

    addHour: (timeString, hours) ->
        date = @createDate(timeString)
        date.setHours(date.getHours() + hours)
        @formatUnixTimestamp(date)

    removeHour: (timeString, hours) ->
        date = @createDate(timeString)
        date.setHours(date.getHours() - hours)
        @formatUnixTimestamp(date)
    resolveAddress: ->
        alert "HET WERKT!"
shuttledriveWeb.Helpers.EncodingHelper =
    toBase64: (str) ->
        words = CryptoJS.enc.Latin1.parse(str)
        CryptoJS.enc.Base64.stringify(words)
