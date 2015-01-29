import DS from 'ember-data';

var Album = DS.Model.extend({
  pictures: DS.hasMany('picture', {async: true})
});

Album.reopenClass({
  FIXTURES:[
  {
    id: 7,
    pictures: [8]
  }
  ]
});

export default Album;
