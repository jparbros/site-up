SiteUp.SitesRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', SiteUp.Site.find())

SiteUp.SitesNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', SiteUp.Site.createRecord())