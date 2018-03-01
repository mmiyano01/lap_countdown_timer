class UnlimitedLapViewModel
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
    @duration = ko.observable("")
    @interval = ko.observable("")
    @notif_time = ko.observable("")
    @count = ko.observable("")
    @mode = ko.observable("working")

  excute_timer: (duration, interval, notif_time) ->
    @count(duration)
    @duration(duration)
    @interval(interval)
    @notif_time(notif_time)
    _counter(@)

$ ->
  ko.applyBindings new UnlimitedLapViewModel()