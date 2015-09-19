angular.module 'rstatus'
  .directive 'resourceValidator', ($filter, $q, inflector) ->
    restrict: 'A'
    require: 'ngModel'
    scope:
      resource: '=resourceValidator'
    link: (scope, element, attrs, ngModel) ->
      ngModel.$asyncValidators.resourceValidator = (value) ->
        scope.resource.validate().then (response) ->
          modelName = ngModel.$name
          inflectedName = inflector.dasherize(modelName).replace(/_/g, ' ')
          formattedName = $filter('capitalize')(inflectedName)

          errors = response.errors[ngModel.$name] ? []
          ngModel.$errors = errors.map (error) -> "#{formattedName} #{error}"

          return true if R.isEmpty errors
          $q.reject errors
