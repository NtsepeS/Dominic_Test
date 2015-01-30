import DS from 'ember-data';

var Album = DS.Model.extend({
  pictures: DS.hasMany('picture', {async: true})
});

export default Album;
