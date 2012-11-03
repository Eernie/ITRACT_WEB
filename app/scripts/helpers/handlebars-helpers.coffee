###
Toyota TV Helpers
###

###
Date Format
Converts UNIX Epoch time to DD.MM.YY
1343691442862 -> 31.07.12
Usage: {{dateFormat yourDate}}
###
Handlebars.registerHelper "dateFormat", (context) ->
  date = new Date(context*1000)
  day = date.getDate()
  month = date.getMonth() + 1
  year = String(date.getFullYear()).substr(2, 3)
  ((if day < 10 then "0" else "")) + day + "." + ((if month < 10 then "0" else "")) + month + "." + year


###
Date Format (datetime)
Converts UNIX Epoch time to YYYY-MM-DD
1343691442862 -> 2012-7-31
Usage: {{dateFormatTime yourDate}}
###
Handlebars.registerHelper "dateFormatTime", (context) ->
  date = new Date(context*1000)
  date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()



###

###
Handlebars.registerHelper "dateFormatTimeOnly", (context)->
  date = new Date(context*1000)
  date.getHours() + ":" + date.getMinutes()

###
Duration Format
Converts UNIX Epoch time to H.MM.SS
127478 -> 2:07
Usage: {{durationFormat yourTime}}
###
Handlebars.registerHelper "durationFormat", (context) ->
  duration = Math.floor(context)
  hours = (if (duration >= 3600) then Math.floor(duration / 3600) else null)
  mins = (if (hours) then Math.floor(duration % 3600 / 60) else Math.floor(duration / 60))
  secs = Math.floor(duration % 60)
  ((if hours then hours + ":" else "")) + ((if mins < 10 then "0" else "")) + mins + ":" + ((if secs < 10 then "0" else "")) + secs


###
Duration Format ISO
Converts UNIX time to ISO 8601 date format
127478 -> PT2M7S
Usage: {{durationFormatISO yourTime}}
###
Handlebars.registerHelper "durationFormatISO", (context) ->
  duration = Math.floor(context / 1000)
  hours = Math.floor(duration / 3600)
  mins = (if (hours) then Math.floor(duration % 3600 / 60) else Math.floor(duration / 60))
  secs = Math.floor(duration % 60)
  "PT" + hours + "H" + mins + "M" + secs + "S"

Handlebars.registerHelper "capitalize", (str) ->
    str = (if not str? then "" else String(str))
    str.charAt(0).toUpperCase() + str.slice(1).toLowerCase()
