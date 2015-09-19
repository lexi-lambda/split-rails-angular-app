angular.module 'rstatus'
  .filter 'capitalize', ->
    (input) ->
      return '' unless input
      input.charAt(0).toUpperCase() + input.substr(1).toLowerCase()
