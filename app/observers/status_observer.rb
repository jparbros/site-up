class StatusObserver < ActiveRecord::Observer

  def after_create(status)
    puts "PUSHER UPDATE"
    site = status.site
    channel_name = pusher_channel_name(site)
    puts "Chanel: #{channel_name}"
    WebsocketRails[channel_name.to_sym].trigger 'updated', site.to_json
  end
  
  def pusher_channel_name(site)
    channel_name = site.class.to_s.downcase
  end
end