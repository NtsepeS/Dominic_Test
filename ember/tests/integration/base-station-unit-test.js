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

test('visiting /base-station-units/:id should show base station unit details', function(assert) {
  visit('/base-station-units');
  var _this = this,
      baseStationUnitName;

  andThen(function() {
    baseStationUnitName = find(".base-station-list-item__name:eq(0)").text();
  });

  click(".base-station-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'base-station-unit.index');

    var new_name = find(".base-station-unit__name").text();
    assert.equal( new_name.indexOf(baseStationUnitName) > -1, true);
  });
});
