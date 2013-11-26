SiteUp.SiteRoute = Ember.Route.extend
  setupController: (controller, site) ->
    controller.set('content', site)