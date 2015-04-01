import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';
import json from '../helpers/json';
import config from '../../config/environment';

var application, server;

module('Integration: BaseStationSectors', {
  beforeEach: function() {
    application = startApp();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /base-station-sectors should show a list of sectors', function(assert) {
  visit('/base-station-sectors');

  andThen(function() {
    assert.equal(currentPath(), 'base-station-sectors.index');

    var links = find(".base-station-list-item");
    assert.equal( links.length > 0 , true, "Should find more than one sector");
  });
});

test('visiting /base-station-sectors/:id should show base station sector details', function(assert) {
  visit('/base-station-sectors');
  var baseStationSectorName;

  andThen(function() {
    baseStationSectorName = find(".base-station-list-item__name:eq(0)").text();
  });

  click(".base-station-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'base-station-sector.index');

    var new_name = find(".base-station-sector__name").text();
    assert.equal( new_name.indexOf(baseStationSectorName) > -1, true, "Name should be the name we clicked on");
  });
});

test('visiting /base-station-sectors/new should create a new base station sector', function(assert) {
  var newName = Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5);

  visit('/base-station-sectors/new');

  andThen(function() {
    fillIn('.base-station-sector__name', newName);
    fillIn('.base-station-sector__status', 1);
    fillIn('.base-station-sector__base-station-unit', 1);
  });

  click('.qa-save');

  andThen(function() {
    assert.equal(currentPath(), 'base-station-sector.index');
  });

  visit('/base-station-sectors');
});

test('visiting /base-station-sectors/:id/edit should edit a new base station unit', function(assert) {
  visit('/base-station-sectors');
  var newName = Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5),
      baseStationUnitName;

  andThen(function() {
    baseStationUnitName = find(".base-station-list-item__name:eq(0)").text();
  });

  click(".base-station-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'base-station-sector.index');
  });

  click(".base-station-sector__edit");

  andThen(function() {
    fillIn('.base-station-sector__name', newName);
    fillIn('.base-station-sector__status', 1);
    fillIn('.base-station-sector__base-station-unit', 1);
  });

  click('.qa-save');

  andThen(function() {
    assert.equal(currentPath(), 'base-station-sector.index');
  });
});

test('clicking delete on a base-station-sector should remove the record', function(assert) {
  visit('/base-station-sectors');
  var baseStationUnitName;

  andThen(function() {
    baseStationUnitName = find(".base-station-list-item__name:eq(0)").text();
  });

  click(".base-station-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'base-station-sector.index');
  });

  click(".base-station-sector__delete");

  andThen(function() {
    click('.modal__yes');
  });

  andThen(function() {
    assert.equal(currentPath(), 'base-station-sectors.index');
  });

  visit('/base-station-sectors');

  andThen(function() {
    assert.equal(baseStationUnitName.indexOf(find(".base-station-list-item__name:eq(0)").text())  == -1 , true);
  });


});
