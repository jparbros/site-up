object @site
attributes :id, :name, :url, :status_ids, :statuses_to_chart, :setting_id, :status_ok

child :setting do
  attributes :id, :interval, :active, :site_id, :created_at
end
