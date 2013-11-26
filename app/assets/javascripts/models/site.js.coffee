SiteUp.Site = DS.Model.extend
  name: DS.attr('string')
  url: DS.attr('string')
  statusesToChart: DS.attr('media')
  setting: DS.belongsTo('SiteUp.Setting')
  statusOk: DS.attr('boolean')
