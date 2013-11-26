DS.WebSocket = Ember.Object.extend
  socketUrl: 'localhost:3020/websocket'
  
  init: ->
    @socket = new WebSocketRails(@get('socketUrl'))
    
    DS.set('defaultWebSocket', @) unless DS.defaultWebSocket
  
  subscribe: (channel) ->
    return @socket.subscribe(channel);

DS.Model.reopenClass

  rootForType: (type) ->
    return type.url if type.url

    parts = type.toString().split(".")
    name = parts[parts.length - 1]
    return name.replace(/([A-Z])/g, '_$1').toLowerCase().slice(1)

  subscribe: ->
    type = this
    chanel = DS.defaultWebSocket.subscribe(@rootForType(type));
    store = DS.defaultStore
    adapter = store.adapter.create()

    chanel.bind 'created', (data) ->
      data = JSON.parse data
      console.log('created' + JSON.stringify(data))
      Ember.run(adapter, 'didCreateRecord', store, type, record, data)

    chanel.bind 'updated', (data) ->
      data = JSON.parse data
      console.log('updated' + JSON.stringify(data))
      record = type.find(data.site.id)
      if record.get('id')
        Ember.run(adapter, 'didUpdateRecord', store, type, record, data)
      else
        Ember.run(adapter, 'didCreateRecord', store, type, record, data)

    chanel.bind 'destroyed', (data) ->
      data = JSON.parse data
      console.log('destroyed' + JSON.stringify(data))
      record = type.find(data.site.id)
      Ember.run(adapter, 'didDeleteRecord', store, type, record, json)
