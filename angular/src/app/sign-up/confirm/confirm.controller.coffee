angular.module 'rstatus'
  .controller 'ConfirmController', ($auth, $log, $state, $stateParams, User) ->
    $state.go 'dashboard' if $auth.sessionExists()

    @status = 'loading'

    User.confirm(confirmationToken: $stateParams.confirmationToken)
      .then (=> @status = 'success'), (response) =>
        @status = 'failure'
        console.error response

    @
