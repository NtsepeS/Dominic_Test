import {
  moduleFor,
  test
} from 'ember-qunit';
import DS from 'ember-data';
import Ember from 'ember';

// FactoryGirl like setup
var i = 0;
function performanceParam(attrs) {
  return Ember.merge(JSON.parse(JSON.stringify({
    id: i++
  })), attrs);
}

moduleFor('model:calculated-rf-performance', {
  // Specify the other units that are required for this test.
  needs: ["model:rf-performance-parameter", "model:radio", 'model:modulation'],
  beforeEach: function() {
    this.container.register("store:main", DS.Store);
    this.store = this.container.lookup("store:main");
  }
});

test('it exists', function(assert) {
  var model = this.subject();
  assert.ok(!!model);
});

test('it starts off empty', function(assert) {
  var model = this.subject();
  assert.equal( model.get('length'), 0 );
});

test('with one parameter, we have one entry', function(assert) {
  var _this = this, p1;

  Ember.run(function() {
    p1 = _this.store.createRecord('rf-performance-parameter', performanceParam({}));
  });

  var model = this.subject({ rfPerformanceParameters: [p1] });

  assert.equal( model.get('length'), 1 );
  assert.equal( model.get('firstObject'), p1 );
});

test('with two parameters, we have two entries and a calculation', function(assert) {
  var _this = this, p1, p2;

  Ember.run(function() {
    p1 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.1}));
    p2 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.0}));
  });

  var model = this.subject({ rfPerformanceParameters: [p1, p2] });

  assert.equal( model.get('length'), 3 );

  var calculated = model.get('lastObject');
  assert.ok( calculated.get('isCalculated') );
});

test('with 3 parameters, we have 3 entries and a calculation', function(assert){ 
  var _this = this, p1, p2, p3;

  Ember.run(function() {
    p1 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.1}));
    p2 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.0}));
    p3 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 0.5}));
  });

  var model = this.subject({ rfPerformanceParameters: [p1, p2, p3] });

  assert.equal( model.get('length'), 4 );
  assert.equal( model.get('lastObject'), p3 );
});

test('should recalculate when the parameters are added', function(assert) {
  var _this = this, p1, p2;

  Ember.run(function() {
    p1 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.1}));
    p2 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.0}));
  });

  var inputs = [p1];
  var model = this.subject({ rfPerformanceParameters: inputs });

  assert.equal( model.get('length'), 1 );

  inputs.pushObject( p2 );
  assert.equal( model.get('length'), 3 );
});

test('should recalculate when a parameter is removed', function(assert){ 
  var _this = this, p1, p2, p3;

  Ember.run(function() {
    p1 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.1}));
    p2 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 1.0}));
    p3 = _this.store.createRecord('rf-performance-parameter', performanceParam({uplinkRssi: 0.5}));
  });

  var inputs = [p1, p2, p3];
  var model = this.subject({ rfPerformanceParameters: inputs });

  assert.equal( model.get('length'), 4 );

  inputs.removeObject(p3);
  assert.equal( model.get('length'), 3 );

});
