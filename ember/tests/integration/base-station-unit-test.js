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
  var baseStationUnitName;

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

test('visiting /base-station-units/new should create a new base station unit', function(assert) {
  visit('/base-station-units/new');
  var newName = "Some awesome base station unit name";

  andThen(function() {
    fillIn('.base-station-unit__name', newName);
    fillIn('.base-station-unit__status', 1);
    fillIn('.base-station-unit__core-node', 1);
  });

  click('.qa-save');

  andThen(function() {
    assert.equal(currentPath(), 'base-station-unit.index');

    assert.equal(find('.base-station-unit__name').text().indexOf(newName) > -1, true);
  });
});
