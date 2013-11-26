SiteUp.Router.map ->
  @resource 'home'
  @resource "sites", ->
    @route "new"
    @route "show", path: ":site_id"
    @route "edit", path: ":site_id/edit"
  @route "site", path: "site/:site_id"