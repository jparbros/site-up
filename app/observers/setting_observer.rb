class SettingObserver < ActiveRecord::Observer

  def after_create(setting)
    puts "PUSHER CREATE"
    channel_name = pusher_channel_name(setting)
    WebsocketRails[channel_name.to_sym].trigger 'created', setting.to_json
  end

  def after_update(setting)
    puts "PUSHER UPDATE"
    channel_name = pusher_channel_name(setting)
    WebsocketRails[channel_name.to_sym].trigger 'updated', setting.to_json
  end

  def before_destroy(setting)
    puts "PUSHER DESTROY"
    channel_name = pusher_channel_name(setting)
    WebsocketRails[channel_name.to_sym].trigger 'destroyed', setting.to_json
  end

  def pusher_channel_name(setting)
    channel_name = setting.class.to_s.downcase
  end
end