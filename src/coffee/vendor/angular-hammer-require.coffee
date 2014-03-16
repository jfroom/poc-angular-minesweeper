#
# * angular-hammer v1.0.3
# * (c) 2013 Monospaced http://monospaced.com
# * License: MIT
#
require [
  "angular"
  "hammer"

], (angular, Hammer) ->
  ((window, angular, Hammer) ->
    hmTouchEvents = angular.module("hmTouchEvents", [])
    hmGestures = [
      "hmHold:hold"
      "hmTap:tap"
      "hmDoubletap:doubletap"
      "hmDrag:drag"
      "hmDragstart:dragstart"
      "hmDragend:dragend"
      "hmDragup:dragup"
      "hmDragdown:dragdown"
      "hmDragleft:dragleft"
      "hmDragright:dragright"
      "hmSwipe:swipe"
      "hmSwipeup:swipeup"
      "hmSwipedown:swipedown"
      "hmSwipeleft:swipeleft"
      "hmSwiperight:swiperight"
      "hmTransform:transform"
      "hmTransformstart:transformstart"
      "hmTransformend:transformend"
      "hmRotate:rotate"
      "hmPinch:pinch"
      "hmPinchin:pinchin"
      "hmPinchout:pinchout"
      "hmTouch:touch"
      "hmRelease:release"
    ]
    angular.forEach hmGestures, (name) ->
      directive = name.split(":")
      directiveName = directive[0]
      eventName = directive[1]
      hmTouchEvents.directive directiveName, [
        "$parse"
        "$window"
        ($parse, $window) ->
          return (
            restrict: "A, C"
            link: (scope, element, attr) ->
              expr = $parse(attr[directiveName])
              fn = (event) ->
                scope.$apply ->
                  expr scope,
                    $event: event

                  return

                return

              opts = $parse(attr["hmOptions"])(scope, {})
              hammer = undefined
              if typeof Hammer is "undefined" or not $window.addEventListener

                # fallback to mouse events where appropriate
                element.bind "click", fn  if directiveName is "hmTap"
                element.bind "dblclick", fn  if directiveName is "hmDoubletap"
                return

              # don't create multiple Hammer instances per element
              unless hammer = element.data("hammer")
                hammer = Hammer(element[0], opts)
                element.data "hammer", hammer

              # bind Hammer touch event
              hammer.on eventName, fn

              # unbind Hammer touch event
              scope.$on "$destroy", ->
                hammer.off eventName, fn
                return

              return
          )
      ]
      return

    return
  ) window, angular, Hammer
