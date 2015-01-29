import DS from 'ember-data';

var Pictures = DS.Model.extend({
  mechanism:    DS.attr('string'),
  picture_data: DS.attr('string'),
  date_taken:   DS.attr('date'),
  album:        DS.belongsTo('album', {async: true})
});

Pictures.reopenClass({
  FIXTURES:[
  {
    id:            8,
    mechanism:     'url',
    // date_taken: '36627'
    picture_data:  'http://www.diaryabout.com/wp-content/uploads/2014/04/url-small.jpg',
    album:         7
  }
  ]
});

export default Pictures;
