angular.module 'rstatus'
  .directive 'resourceErrors', ($q) ->
    restrict: 'A'
    scope:
      model: '=resourceErrors'
    templateUrl: 'app/directives/resource-errors/resource-errors.html'
    transclude: true
