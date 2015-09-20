describe '$auth', ->
  beforeEach module 'rstatus'

  CREATE_TOKEN_URL = null

  $auth = null
  $httpBackend = null

  beforeEach inject (API_URL, _$auth_, _$httpBackend_) ->
    CREATE_TOKEN_URL = "#{API_URL}/v1/users/session_token"
    $auth = _$auth_
    $httpBackend = _$httpBackend_

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe '#authorize', ->
    beforeEach ->
      validCredentials =
        user:
          email: 'EMAIL'
          password: 'PASSWORD'

      $httpBackend.when('POST', CREATE_TOKEN_URL, validCredentials)
        .respond session_token: 'EXPECTED TOKEN'

      $httpBackend.when('POST', CREATE_TOKEN_URL)
        .respond 401, error: 'EXPECTED ERROR'

    it 'attempts to authorize the user',
      inject ($httpBackend) ->
        $httpBackend.expectPOST CREATE_TOKEN_URL
        $auth.authorize {}
        $httpBackend.flush()

    it 'creates a session when the credentials are correct', ->
      $auth.authorize email: 'EMAIL', password: 'PASSWORD'
      $httpBackend.flush()
      expect($auth.sessionExists()).toBe true

    it 'does not create a session when the credentials are incorrect', ->
      $auth.authorize {}
      $httpBackend.flush()
      expect($auth.sessionExists()).toBe false
