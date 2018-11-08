class UnlimitedLapViewModel
  timer = null
  noSleep = new NoSleep()

  _counter = (that) ->
    that["count"](that["count"]() - 1)
    timer = setTimeout (-> _counter(that)), 1000

    #TODO play "notification" sound
    if that['mode']() == "working"
      if [10].includes(that["count"]())
        play_sound("#notif_sound")
    if that["count"]() == 5
      if that["mode"]() == "interval"
        play_sound("#notif_sound")
      that["color_box"]("bk_yellow")

    if that['count']() == 0
      if that["mode"]() == "working"
        play_sound("#done_sound")
      if that["mode"]() == "interval"
        play_sound("#start_sound")
    if that["count"]() < 0
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
    noSleep.disable()

    _counter(@)

  stop_timer: ->
    noSleep.enable()
    clearTimeout(timer)

  reset_timer: ->
    @count(null)
    @mode("working")
    @color_box("bk_blue")

  play_sound = (key) ->
    sound = document.querySelector(key)
    window.audio = new Audio();
    window.audio.src = sound.src
    window.audio.play()
    
$ ->
  ko.applyBindings new UnlimitedLapViewModel()
