window.pusher = new Pusher("e0b99b0d36b58487f611")

( ->
  Emberpusher = (channel, model, store) ->
    @channel = channel
    @model = model
    @store = store
    
    console.log(@store)

    @channel.bind "created", (pushed_model) =>
      console.log('created' + JSON.stringify(pushed_model))
      DS.defaultStore.load(@model, pushed_model)

    @channel.bind "updated", (pushed_model) =>
      console.log('updated' + JSON.stringify(pushed_model))
      record = @store.find(@model, pushed_model.id)
      record.get('store').load(@model, pushed_model.id) unless record.get('isDirty')

    @channel.bind "destroyed", (pushed_model) =>
      console.log('destroyed' + JSON.stringify(pushed_model))
      record = @store.find(@model,pushed_model.id)
      record.unloadRecord() unless record.get('isDeleted')

  @Emberpusher = Emberpusher
).call this