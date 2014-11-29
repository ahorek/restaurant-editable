class Admin::PagesController < PagesController

  before_filter :require_admin
  layout "admin"

  include LanguagesHelper

  def settings
    @fb_setting = Setting.where(:name => 'facebook_url').first
    @fo_setting = {}
    available_languages.each do |lang|
      @fo_setting[lang] = Setting.where(:name => "text_page_footer_#{lang}").first
    end
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
