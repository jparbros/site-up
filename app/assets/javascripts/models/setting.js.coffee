SiteUp.Setting = DS.Model.extend
  interval: DS.attr('number')
  active: DS.attr('boolean')
  site: DS.belongsTo('SiteUp.Site')
