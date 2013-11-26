class Site < ActiveRecord::Base
  
  self.include_root_in_json = true
  
  #
  # Associations
  #
  has_many :statuses, -> { limit(20)}, dependent: :destroy
  has_one  :setting, dependent: :destroy
  
  #
  # Validations
  #
  validates :name, :url, presence: true
  
  #
  # Callbacks
  #
  after_create :create_settings, :schedule_worker

  #
  # Nested Attributes
  #
  accepts_nested_attributes_for :setting
  
  def add_status(time, success)
    statuses.create response_time: time, success: success
  end
  
  def schedule_worker
    ::Workers::SiteUp.perform_in(setting.interval.minutes.from_now, id)
  end
  
  def statuses_to_chart
    statuses.order('created_at DESC').reverse.map.with_index {|status, index| {x: status.created_at.to_i, y: status.response_time}}
  end
  
  def setting_id
    setting.id
  end
  
  def status_ok
    last_status = statuses.order('created_at DESC').limit(1).first
    last_status.present? ? last_status.success : false
  end
  
  def setting=(setting_params)
    setting.update_attributes setting_params
  end
  
  def as_json(options={})
    super(options.merge(:methods => [:status_ok, :statuses_to_chart, :setting_id]))
  end
  
  private
  
  def create_settings
    create_setting interval: 5, active: true
  end
end
