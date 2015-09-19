angular.module 'rstatus'
  .config ($httpProvider, $locationProvider, $logProvider) ->
    $httpProvider.interceptors.push 'authInterceptor'

    $locationProvider.html5Mode true
    $logProvider.debugEnabled true
