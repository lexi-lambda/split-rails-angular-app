describe 'SignInController', ->
  beforeEach module 'rstatus'

  CREATE_TOKEN_URL = null
  vm = null

  beforeEach inject (API_URL, $controller) ->
    CREATE_TOKEN_URL = "#{API_URL}/v1/users/session_token"
    vm = $controller 'SignInController'

  describe '#submitSignIn', ->
    describe 'when username and password are correct', ->
      beforeEach inject ($auth, $q) ->
        spyOn($auth, 'authorize')
          .and.returnValue $q.when(true)

      it 'navigates to the dashboard',
        inject ($timeout, $state) ->
          vm.submitSignIn()
          $timeout.flush()
          expect($state.current.name).toBe 'dashboard'

    describe 'when username and password are incorrect', ->
      beforeEach inject ($auth, $q) ->
        spyOn($auth, 'authorize')
          .and.returnValue $q.reject(data: { error: 'ERROR MESSAGE' })

      it 'does not move to a new route',
        inject ($timeout, $state) ->
          vm.submitSignIn()
          $timeout.flush()
          expect($state.current.name).toBe 'sign-in'

      it 'sets vm.error to the error message',
        inject ($timeout, $state) ->
          vm.submitSignIn()
          $timeout.flush()
          expect(vm.error).toBe 'ERROR MESSAGE'
