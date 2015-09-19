angular.module 'rstatus'
  .controller 'SignUpController', ($auth, $state, User) ->
    $state.go 'dashboard' if $auth.sessionExists()

    @user = new User()

    @submitSignUp = =>
      $auth.register(@user)
        .then (response) ->
          $state.go 'sign-up-confirmation-sent'

    @
