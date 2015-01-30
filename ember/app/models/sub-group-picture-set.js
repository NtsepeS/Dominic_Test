import DS from 'ember-data';

var SubGroupPictureSet = DS.Model.extend({
  album:                  DS.belongsTo('album', {async: true}),
  subGroupClassification: DS.belongsTo('sub-group-classification', {async: true}),
  clientLink:             DS.belongsTo('client-link', {async: true})
});

export default SubGroupPictureSet;
