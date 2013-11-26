class SitesController < ApplicationController
  
  respond_to :json
  
  def index
    @sites = Site.all
    respond_with @sites
  end
  
  def create
    @site = Site.create site_params
    respond_with @site
  end
  
  def show
    @site = Site.find params[:id]
    respond_with @site
  end
  
  def update
    @site = Site.find params[:id]
    @site.update_attributes site_params
    respond_with @site
  end
  
  private
  
  def site_params
    params.require(:site).permit(
      :name,
      :url,
      setting: [
        :interval,
        :active]
      )
  end
end
