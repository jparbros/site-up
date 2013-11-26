class SiteObserver < ActiveRecord::Observer

  def after_create(site)
    puts "PUSHER CREATE"
    channel_name = pusher_channel_name(site)
    WebsocketRails[channel_name].trigger 'created', site.to_json
  end

  def after_update(site)
    puts "PUSHER UPDATE"
    channel_name = pusher_channel_name(site)
    WebsocketRails[channel_name].trigger 'updated', site.to_json
  end

  def before_destroy(site)
    puts "PUSHER DESTROY"
    channel_name = pusher_channel_name(site)
    WebsocketRails[channel_name.trigger].trigger 'destroyed', site.to_json
  end

  def pusher_channel_name(site)
    channel_name = site.class.to_s.downcase.to_sym
  end
end