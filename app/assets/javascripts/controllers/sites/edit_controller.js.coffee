SiteUp.SitesEditController = Ember.Controller.extend
  updateSite: ->
    @get('store').commit();