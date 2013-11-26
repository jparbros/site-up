SiteUp.SitesNewController = Ember.Controller.extend
  createSite: ->
    @get('store').commit();