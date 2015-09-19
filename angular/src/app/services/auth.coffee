angular.module 'rstatus'
  .factory '$auth', ($localStorage, User) ->
    $storage = $localStorage.auth ||= {}

    authorize: ({ email, password }) ->
      User.createSessionToken({ email, password })
        .then (token) ->
          $storage.sessionToken = token
          true

    destroySession: ->
      delete $storage.sessionToken

    sessionExists: ->
      !!$storage.sessionToken

    register: ({ email, password }) ->
      new User({ email, password }).create()
