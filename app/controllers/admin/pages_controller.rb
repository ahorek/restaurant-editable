class Admin::PagesController < PagesController

  before_filter :require_admin
  layout "admin"

  def settings
    @fb_setting = Setting.where(:name => 'facebook_url').first
    @ms_setting = Setting.where(:name => 'menu_sublinks').first
  end

  def index
    super
    @page = 'index'
  end

  def about
    super
    @page = 'about'
  end

  def contact
    super
    @page = 'contact'
  end

  def gallery
    super
    @page = 'gallery'
  end

end
