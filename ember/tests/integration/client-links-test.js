import Ember from 'ember';
import {
  module,
  test
} from 'qunit';
import startApp from 'cops/tests/helpers/start-app';
import json from '../helpers/json';
import config from '../../config/environment';

var application, server;

module('Integration: ClientLinks', {
  beforeEach: function() {
    if (config.featureFlags['integration-tests']){
        application = startApp();
        authenticateSession();
    }
  },

  afterEach: function() {
    if (config.featureFlags['integration-tests']){
      Ember.run(application, 'destroy');
    }
  }
});

// FactoryGirl like setup
var i = 0;
function clientLink(attrs) {
  return Ember.merge(JSON.parse(JSON.stringify({
    id: i++
  })), attrs);
}

test('visiting /client-links should show a list of links', function(assert) {
  if (config.featureFlags['integration-tests']){
    visit('/client-links');

    andThen(function() {
      assert.equal(currentPath(), 'client-links.index');

      var links = find(".c-client-link-list-item");
      assert.equal( links.length > 0 , true);
    });
  } else {
    assert.equal(1,1);
  }
});

test('Read client link', function(assert) {
  if (config.featureFlags['integration-tests']){
  visit('/client-links');
  var name;

  andThen(function(){
    name = find(".c-client-link-list-item__name:eq(0)").text();
  });

  click(".c-client-link-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'client-link.overview.index', "Should navigate to overview index");

    var new_name = find(".clientlink__name");
    assert.equal( new_name.text().indexOf(name) > -1, true, "Name should equal the name we clicked on" );
  });
  } else {
    assert.equal(1,1);
  }
});

test('Create new client link', function(assert) {
  if (config.featureFlags['integration-tests']){
  visit('/client-links/new');
  var client = 'Bridgestone',
      branch = 'Happy branch',
      status = 'Operational',
      circuitNumber = 'num num',
      networkOperator = 'Internet Solutions',
      msadNumber = 'num num',
      linkType = 'Normal',
      activationDate = '',
      sectorName = 'Sector 1',
      macAddress = 'mac mac',
      antenna = '30cm',
      solutionId = 'id id',
      billingAccount = 'account account',
      serviceAcount = 'service service',
      serviceAccountSite = 'site site';

  andThen(function() {
    fillIn('.clientlink__client ', 1);
    fillIn('.clientlink__branch', branch);
    fillIn('.clientlink__status', 1);
    fillIn('.clientlink__circuit-number', circuitNumber);
    fillIn('.clientlink__network-operator', 1);
    fillIn('.clientlink__msad-number', msadNumber);
    fillIn('.clientlink__link-type', 1);
    fillIn('.clientlink__activation-date', activationDate);
    fillIn('.clientlink__sector-name', 1);
    fillIn('.clientlink__mac-address', macAddress);
    fillIn('.clientlink__antenna', 1);
    fillIn('.clientlink__solution-id', solutionId);
    fillIn('.clientlink__billing-account', billingAccount);
    fillIn('.clientlink__service-account', serviceAcount);
    fillIn('.clientlink__service-account-site', serviceAccountSite);

    assert.equal(currentPath(), 'client-links.new');
  });

  click('.qa-save');

  andThen(function() {
    assert.equal(currentPath(), 'client-link.overview.edit');

    assert.equal(find('.clientlink__client option:selected').text(), client);
    assert.equal(find('.clientlink__branch').val(), branch);
    assert.equal(find('.clientlink__status option:selected').text(), status);
    assert.equal(find('.clientlink__circuit-number').val(), circuitNumber);
    assert.equal(find('.clientlink__network-operator option:selected').text(), networkOperator);
    assert.equal(find('.clientlink__msad-number').val(), msadNumber);
    assert.equal(find('.clientlink__link-type option:selected').text(), linkType);
    assert.equal(find('.clientlink__activation-date').val(), activationDate);
    assert.equal(find('.clientlink__sector-name option:selected').text(), sectorName);
    assert.equal(find('.clientlink__mac-address').val(), macAddress);
    assert.equal(find('.clientlink__antenna option:selected').text(), antenna);
    assert.equal(find('.clientlink__solution-id').val(), solutionId);
    assert.equal(find('.clientlink__billing-account').val(), billingAccount);
    assert.equal(find('.clientlink__service-account').val(), serviceAcount);
    assert.equal(find('.clientlink__service-account-site').val(), serviceAccountSite);
  });
} else {
    assert.equal(1,1);
  }
});

test('Update client link', function(assert) {
  if (config.featureFlags['integration-tests']){
  visit('/client-links');
  var new_branch = 'New Branch Name';

  click(".c-client-link-list-item__name:eq(0)");

  andThen(function(){
    assert.equal(currentPath(), 'client-link.overview.index', "Should navigate to overview index");
  });

  click(".clientlink__edit");

  andThen(function() {
    fillIn('.clientlink__branch', new_branch);

    fillIn('.clientlink__client ', 1);
    fillIn('.clientlink__status', 1);
    fillIn('.clientlink__network-operator', 1);
    fillIn('.clientlink__link-type', 1);
    fillIn('.clientlink__sector-name', 1);
    fillIn('.clientlink__antenna', 1);
  });

  click('.qa-save');

  andThen(function() {
    assert.equal(find('.clientlink__branch').text().indexOf(new_branch) > -1, true, "Branch");
    assert.equal(find('.clientlink__client').text().indexOf('Bridgestone') > -1 , true,'Client');
    assert.equal(find('.clientlink__status').text().indexOf('Operational') > -1 , true,'Status');
    assert.equal(find('.clientlink__network-operator').text().indexOf('Internet Solutions') > -1 , true, 'Network Operator');
    assert.equal(find('.clientlink__link-type').text().indexOf('Normal') > -1 , true, "Link Type");
    assert.equal(find('.clientlink__sector-name').text().indexOf('Sector 1') > -1 , true, "Sector");
    assert.equal(find('.clientlink__antenna').text().indexOf('30cm') > -1 , true, "Antenna");

  });
  } else {
    assert.equal(1,1);
  }

});




