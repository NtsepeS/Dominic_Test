module.exports = function(app) {
  var express = require('express'),
      _ = require("lodash");
  var clientLinksRouter = express.Router();

  var fixtures = [{
    id: "1",
    name: "Upington"
  }];

  clientLinksRouter.get('/', function(req, res) {
    res.send({
      'client-links': fixtures
    });
  });

  clientLinksRouter.post('/', function(req, res) {
    res.status(201).end();
  });

  clientLinksRouter.get('/:id', function(req, res) {
    var link = _.find(fixtures, function(obj) { return obj.id === req.params.id });
    res.send({
      'client_link': link
    });
  });

  clientLinksRouter.put('/:id', function(req, res) {
    res.send({
      'client-links': {
        id: req.params.id
      }
    });
  });

  clientLinksRouter.delete('/:id', function(req, res) {
    res.status(204).end();
  });

  app.use('/mocks/client-links', clientLinksRouter);
};
