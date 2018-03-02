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
    @duration = ko.observable(10)
    @interval = ko.observable(10)
    @notif_time = ko.observable(10)
    @count = ko.observable("")
    @mode = ko.observable("working")

  excute_timer: ->
    @count(@duration())
    _counter(@)

$ ->
  ko.applyBindings new UnlimitedLapViewModel()