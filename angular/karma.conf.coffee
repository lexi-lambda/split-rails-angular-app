path    = require 'path'
conf    = require './gulp/conf'
_       = require 'lodash'
wiredep = require 'wiredep'

listFiles = ->
  wiredepOptions = _.extend {}, conf.wiredep,
    dependencies: true,
    devDependencies: true

  wiredep(wiredepOptions).js
    .concat [
      path.join(conf.paths.tmp, '/serve/app/**/*.module.js')
      path.join(conf.paths.tmp, '/serve/app/**/*.js')
      path.join(conf.paths.src, '/**/*.spec.coffee')
      path.join(conf.paths.src, '/**/*.mock.coffee')
      path.join(conf.paths.src, '/**/*.html')
    ]

module.exports = (config) ->
  configuration =
    files: listFiles()

    singleRun: true

    autoWatch: false

    frameworks: ['jasmine', 'angular-filesort']

    angularFilesort:
      whitelist: [path.join(conf.paths.tmp, '/**/!(*.html|*.spec|*.mock).js')]

    ngHtml2JsPreprocessor:
      stripPrefix: 'src/'
      moduleName: 'rstatus'

    browsers : ['PhantomJS']

    plugins : [
      'karma-angular-filesort'
      'karma-coffee-preprocessor'
      'karma-jasmine'
      'karma-ng-html2js-preprocessor'
      'karma-phantomjs-launcher'
    ]

    preprocessors:
      'src/**/*.html': ['ng-html2js']
      'src/**/*.coffee': ['coffee']

  # This block is needed to execute Chrome on Travis
  # If you ever plan to use Chrome and Travis, you can keep it
  # If not, you can safely remove it
  # https://github.com/karma-runner/karma/issues/1144#issuecomment-53633076
  if configuration.browsers[0] == 'Chrome' && process.env.TRAVIS
    configuration.customLaunchers =
      'chrome-travis-ci':
        base: 'Chrome'
        flags: ['--no-sandbox']
    configuration.browsers = ['chrome-travis-ci']

  config.set configuration
