'use strict';

var paths = require('./.yo-rc.json')['generator-gulp-angular'].props.paths;

// An example configuration file.
exports.config = {
  seleniumServerJar: './node_modules/selenium-standalone-jar/bin/selenium-server-standalone-2.45.0.jar',
  chromeDriver: './node_modules/chromedriver/bin/chromedriver',

  // Capabilities to be passed to the webdriver instance.
  capabilities: {
    'browserName': 'chrome'
  },

  baseUrl: 'http://localhost:3000',

  // Spec patterns are relative to the current working directly when
  // protractor is called.
  specs: [paths.e2e + '/**/*.coffee'],

  // Options to be passed to Jasmine-node.
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
};
