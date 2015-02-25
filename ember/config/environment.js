/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'cops',
    environment: environment,
    baseURL: '/',
    isidLoginURL: '/users/auth/isoauth2',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },
    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' *.googleapis.com maps.gstatic.com 'unsafe-inline' 'unsafe-eval' cops.dev:35729",
      'font-src': "'self' fonts.gstatic.com data: use.typek ",
      'connect-src': "'self'",
      'img-src': "'self' *.googleapis.com csi.gstatic.com maps.gstatic.com",
      'style-src': "'self' 'unsafe-inline' *.googleapis.com",
      'connect-src': "'self' ws://localhost:35729 ws://0.0.0.0:35729 ws://cops.dev:35729"
    }
  };



  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
