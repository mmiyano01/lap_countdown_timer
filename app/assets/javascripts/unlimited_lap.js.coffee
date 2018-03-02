class UnlimitedLapViewModel
  timer = null

  _counter = (that) ->
    that["count"](that["count"]() - 1)
    timer = setTimeout (-> _counter(that)), 1000

    if that["count"]() == 5
      that["color_box"]("bk_yellow")

    if that["count"]() == 0
      clearTimeout(timer)
      if that["mode"]() == "working"
        that["count"](that["interval"]())
        that["mode"]("interval")
        that["color_box"]("bk_green")
      else if that["mode"]() == "interval"
        that["count"](that["duration"]())
        that["mode"]("working")
        that["color_box"]("bk_red")
      _counter(that)
    return

  constructor: ->
    @duration = ko.observable(10)
    @interval = ko.observable(10)
    @notif_time = ko.observable(10)
    @count = ko.observable(null)
    @mode = ko.observable("working")
    @color_box = ko.observable("bk_blue")

  excute_timer: ->
    if @count() == null
      @count(@duration())

    bk_color = if @mode() == "working"
      "bk_red"
    else if @mode() == "interval"
      "bk_green"
    @color_box(bk_color)

    console.log(@color_box())

    _counter(@)

  stop_timer: ->
    clearTimeout(timer)

  reset_timer: ->
    @count(null)
    @mode("working")
    @color_box("bk_blue")


$ ->
  ko.applyBindings new UnlimitedLapViewModel()