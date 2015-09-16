describe 'The main view', ->
  page = null

  beforeEach ->
    browser.get '/'
    page = require './main.po'

  it 'should include jumbotron with correct data', ->
    expect(page.h1El.getText()).toBe 'ohai'
