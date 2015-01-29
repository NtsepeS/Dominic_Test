import DS from 'ember-data';

var SubGroupPictureSet = DS.Model.extend({
  album:                  DS.belongsTo('album', {async: true}),
  subGroupClassification: DS.belongsTo('sub-group-classification', {async: true}),
  clientLink:             DS.belongsTo('client-link', {async: true})
});

SubGroupPictureSet.reopenClass({
  FIXTURES: [
  {
    id:                     4,
    album:                  7,
    subGroupClassification: 2,
    clientLink:             1,
  }
  ]
});

export default SubGroupPictureSet;
