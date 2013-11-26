SiteUp.ApplicationRoute = Ember.Route.extend
  events: 
    openModal: (modal, view, controller) ->
      @render modal,
        into: 'application',
        outlet: 'modal'
        view: view
        controller: controller
      $('.modal').modal();

    closeModal: ->
      @render 'empty',
        into: 'application',
        outlet: 'modal'
      $('.modal').modal('hide');
