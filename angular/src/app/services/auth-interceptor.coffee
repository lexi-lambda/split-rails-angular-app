angular.module 'rstatus'
  .factory 'authInterceptor', ($localStorage, $log, $q) ->
    request: (config) ->
      config.headers ||= {}
      if token = $localStorage.auth?.sessionToken
        config.headers.Authorization = "Bearer #{token}"
      config
