module Workers
  class SiteUp
    include Sidekiq::Worker
    
    def perform(site_id)
      checker = Checker.checker
      checker.check(site_id)
    end
  end
end