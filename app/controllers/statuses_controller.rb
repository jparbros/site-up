class StatusesController < ApplicationController

  respond_to :json

  def index
    site = Site.find(params[:site_id])
    respond_with site.statuses
  end
end
