import DS from 'ember-data';

export default DS.Model.extend({
	vicinity: DS.belongsTo('vicinity', {async: true}),
	geometry: DS.belongsTo('geometry', {async: true}) 
});
