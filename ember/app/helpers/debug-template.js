import Ember from "ember";

export default Ember.Handlebars.makeBoundHelper(function(value, options) {

  console.log("====================");
  console.log("View Context", this);
  console.log("Value", value);

  if (options) {
    console.log("Options", options);
  }

  console.log("====================");

});
