DS.RESTAdapter.registerTransform 'media',
    deserialize: (serialized) -> 
      return serialized;
    
    serialize: (deserialized) ->
        return deserialized;

SiteUpAdapter = DS.RESTAdapter.extend()

SiteUpAdapter.map 'SiteUp.Site',
  setting:
    embedded: 'always'

SiteUp.Store = DS.Store.extend
  revision: 13
  adapter: SiteUpAdapter



