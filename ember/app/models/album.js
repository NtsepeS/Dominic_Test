import DS from 'ember-data';

var Album = DS.Model.extend({
  pictures:               DS.hasMany('picture', {async: true}),
  subGroupClassification: DS.belongsTo('sub-group-classification', {async: true}),
  clientLink:             DS.belongsTo('client-link', {async: true})
});

export default Album;
