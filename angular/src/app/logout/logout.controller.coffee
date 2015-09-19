angular.module 'rstatus'
  .controller 'LogoutController', ($auth, $state) ->
    $auth.destroySession()
    $state.go 'sign-in'

    @
