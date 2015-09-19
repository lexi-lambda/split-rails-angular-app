describe 'controllers', ->

  beforeEach module 'rstatus'

  it 'doesn\'t break logic', inject ($controller) ->
    vm = $controller 'MainController'
    expect(true).toBeTruthy()
