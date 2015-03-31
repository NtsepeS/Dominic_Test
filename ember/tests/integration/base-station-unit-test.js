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

test('visiting /base-station-units should show a list of links', function(assert) {
  visit('/base-station-units');

  andThen(function() {
    assert.equal(currentPath(), 'base-station-units.index');

    var links = find(".base-station-list-item");
    assert.equal( links.length > 0 , true);
  });
});

