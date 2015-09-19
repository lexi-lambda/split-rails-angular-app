describe 'controllers', ->

  beforeEach module 'rstatus'

  it 'doesn\'t break logic', inject ($controller) ->
    vm = $controller 'SignInController'
    expect(true).toBeTruthy()
