SiteUp.IndexRoute = Ember.Route.extend 
  redirect: ->
    @transitionTo('home')