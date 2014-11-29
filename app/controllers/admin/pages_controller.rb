class Admin::PagesController < PagesController

  before_filter :require_admin
  layout "admin"

  include LanguagesHelper

  def settings
    @fo_setting = Setting.where(:name => 'text_page_footer').first
    @fb_setting = Setting.where(:name => 'facebook_url').first
  end

  def index
    super
    @page = 'index'
  end

  def about
    super
    @page = 'about'
  end

  def events
    super
    @page = 'events'
  end

  def contact
    super
    @page = 'contact'
  end

  def partners
    super
    @page = 'partners'
  end

  def gallery1
    super
    @page = 'gallery1'
  end

  def gallery2
    super
    @page = 'gallery2'
  end


end
