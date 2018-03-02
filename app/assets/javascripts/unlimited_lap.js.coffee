class UnlimitedLapViewModel
  timer = null

  _counter = (that) ->
    that["count"](that["count"]() - 1)
    timer = setTimeout (-> _counter(that)), 1000

    if that["count"]() == 0
      clearTimeout(timer)
      if that["mode"]() == "working"
        that["count"](that["interval"]())
        that["mode"]("interval")
      else if that["mode"]() == "interval"
        that["count"](that["duration"]())
        that["mode"]("working")
      _counter(that)
    return

  constructor: ->
    @duration = ko.observable(10)
    @interval = ko.observable(10)
    @notif_time = ko.observable(10)
    @count = ko.observable(null)
    @mode = ko.observable("working")

  excute_timer: ->
    if @count() == null
      @count(@duration())
    _counter(@)

  stop_timer: ->
    clearTimeout(timer)

  reset_timer: ->
    @count(null)


$ ->
  ko.applyBindings new UnlimitedLapViewModel()