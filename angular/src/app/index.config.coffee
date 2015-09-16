angular.module 'rstatus'
  .config ($logProvider, $locationProvider) ->
    $logProvider.debugEnabled true
    $locationProvider.html5Mode true
