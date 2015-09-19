angular.module 'rstatus'
  .controller 'SignInController', ($auth, $state, $timeout) ->
    $state.go 'dashboard' if $auth.sessionExists()

    @error = null
    @isLoading = false
    @signIn = {}

    @submitSignIn = =>
      @error = null
      @isLoading = true

      doAuth = =>
        $auth.authorize(@signIn)
          .then (response) ->
            $state.go 'dashboard'
          .catch (response) =>
            @error = response.data.error
            @isLoading = false

      $timeout doAuth, 2000

    @
