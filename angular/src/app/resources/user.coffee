angular.module 'rstatus'
  .factory 'User', (API_URL, ValidatableResource) ->
    class User extends ValidatableResource
      @configure
        name: 'user'
        url: "#{API_URL}/v1/users"

      @confirm: ({ confirmationToken }) =>
        @$get @$url({}, '/confirmation'), { confirmationToken }

      @createSessionToken: ({ email, password }) =>
        @$post(@$url({}, '/session_token'), { email, password })
          .then (response) -> response.sessionToken
