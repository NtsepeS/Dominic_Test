import Ember from 'ember';

export default Ember.Route.extend({

  setupController: function(controller, model) {

    controller.set('model', model);

    var rfPerformanceParameters = model.get('radio.rfPerformanceParameters')
    console.log("rfPerformaceArrayProxy", rfPerformaceArrayProxy)


    var originalarray = rfPerformanceParameters;
    var duplicatearray = rfPerformanceParameters.toArray();
    var i=0;
    var founded=0;

    while(i<=originalarray.get('length') && founded<=duplicatearray.get('length')){
      if(i%2===0 && i>1){
        var rfPerformanceParameter = Ember.Object.create({
            uplinkRssi: originalarray.objectAt(i-1).get('uplinkRssi') - originalarray.objectAt(i-2).get('uplinkRssi'),
            downlinkRssi: originalarray.objectAt(i-1).get('downlinkRssi') - originalarray.objectAt(i-2).get('downlinkRssi'),
            uplinkCnr: originalarray.objectAt(i-1).get('uplinkCnr') - originalarray.objectAt(i-2).get('uplinkCnr'),
            downlinkCnr: originalarray.objectAt(i-1).get('downlinkCnr') - originalarray.objectAt(i-2).get('downlinkCnr'),
            txPower: originalarray.objectAt(i-1).get('txPower') - originalarray.objectAt(i-2).get('txPower'),
            stepAttenuator: originalarray.objectAt(i-1).get('stepAttenuator') - originalarray.objectAt(i-2).get('stepAttenuator'),
            rfResultSet: "CALCULATED LINE",
        });
        duplicatearray = duplicatearray.insertAt(founded, rfPerformanceParameter);
        founded ++;
      }
      i++;
      founded++;
    }

    console.log(duplicatearray);

    var rfPerformaceArrayProxy = Ember.ArrayProxy.create({ content: Ember.A(duplicatearray) });
    console.log(rfPerformaceArrayProxy);
    controller.set('proxy1', rfPerformaceArrayProxy);

  }
});
