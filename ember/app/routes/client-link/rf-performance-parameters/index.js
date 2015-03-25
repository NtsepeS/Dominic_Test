import Ember from 'ember';

export default Ember.Route.extend({

  setupController: function(controller, model) {

    controller.set('model', model);

    var rfPerformanceParameters = model.get('radio.rfPerformanceParameters')
    console.log("rfPerformaceArrayProxy", rfPerformaceArrayProxy)


    var originalarray = rfPerformanceParameters;
    var duplicatearray = rfPerformanceParameters.toArray();
    var d;
    var i=0;
    var founded=0;

    while(i<=originalarray.get('length') && founded<=duplicatearray.get('length')){
      if(i%2===0 && i>1){
        var rfPerformanceParameter = Ember.Object.create({
            uplinkRssi: 2.46,
            downlinkRssi: 3.45,
            uplinkCnr: 1.43,
            downlinkCnr: 1.44,
            txPower: 1.53,
            stepAttenuator: 5.5,
            rfResultSet: "CALCULATED LINE",
        });
        d = duplicatearray.insertAt(founded, rfPerformanceParameter);
        founded ++;
      }
      i++;
      founded++;
    }

    console.log(d);

    var rfPerformaceArrayProxy = Ember.ArrayProxy.create({ content: Ember.A(d) });
    console.log(rfPerformaceArrayProxy);
    controller.set('proxy1', rfPerformaceArrayProxy);

    // return rfPerformaceArrayProxy

  }
});
