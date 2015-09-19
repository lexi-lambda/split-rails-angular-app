angular.module 'rstatus'
  .factory 'ValidatableResource', (RailsResource) ->
    class ValidatableResource extends RailsResource
      validate: => @constructor.$post @$url('/validate'), @
