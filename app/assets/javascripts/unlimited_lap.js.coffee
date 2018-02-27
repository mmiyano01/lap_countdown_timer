class UnlimitedLapViewModel
  _counter = (that) ->
    that["duration"](that["duration"]() - 1)
    timer = setTimeout (-> _counter(that)), 1000

    if that["duration"]() == 0
      clearInterval(timer)
    return

  constructor: ->
    @duration = ko.observable("")
    @interval = ko.observable("")
    @notif_time = ko.observable("")
    @rest_time = ko.observable(0)

  excute_timer: (duration, interval, notif_time) ->
    @duration(duration)
    @interval(interval)
    @notif_time(notif_time)

    _counter(@)
$ ->
  ko.applyBindings new UnlimitedLapViewModel()