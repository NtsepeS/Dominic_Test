import DS from 'ember-data';

export default DS.Model.extend({
  linetag:         DS.attr('string'),
  lineSpeed:       DS.attr('number'),
  vlan:            DS.attr('string'),
  serviceFragment: DS.belongsTo('service-fragment', { async: true }),
  ports:           DS.hasMany('port', {async: true}),

  vlansString: function() {
    var array = JSON.parse(this.get('vlan'));
    return array.join(", ");
  }.property('vlan'),

  vlans: function() {
    return JSON.parse(this.get('vlan'));
  }.property('vlan')
});
