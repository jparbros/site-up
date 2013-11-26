class Checker
  include Singleton
  
  attr_accessor :response
  
  def self.checker
    self.instance
  end

  def check site_id
    site = Site.find site_id
    klass = self
    times = Benchmark.ms do
      klass.response = Typhoeus.get(site.url, followlocation: true)
    end
    site.add_status times, klass.response.success?
    site.schedule_worker
  end
end