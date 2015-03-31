import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';
import json from '../helpers/json';
import config from '../../config/environment';

var application, server;

module('Integration: BaseStationUnits', {
  beforeEach: function() {
    application = startApp();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});


