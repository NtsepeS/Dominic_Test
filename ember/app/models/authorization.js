import DS from 'ember-data';

export default DS.Model.extend({
    email:         DS.attr('string'),
    princaple_id:  DS.attr('string'),
    invite_id:     DS.attr('string')
});
