window.RailsApp.common =

  init: ->

    # alert fade out
    $('.alert').on 'click', ->
      $(@).parent().fadeOut(500)

    # set timezone
    set_time_zone()

    # Bootstrap popover
    $('[data-toggle="popover"]').popover()
