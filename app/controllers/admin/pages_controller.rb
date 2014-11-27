class Admin::PagesController < PagesController

  before_filter :require_admin
  layout "admin"

  include LanguagesHelper

  def settings
    @fo_setting = Setting.where(:name => 'text_page_footer').first
    @fb_setting = Setting.where(:name => 'facebook_url').first
    @ms_setting = {}
    available_languages.each do |lang|
      @ms_setting[lang] = Setting.where(:name => "menu_sublinks_#{lang}").first
    end
    @gs_setting = {}
    available_languages.each do |lang|
      @gs_setting[lang] = Setting.where(:name => "gallery_sublinks_#{lang}").first
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

  def gallery
    super
    @page = 'gallery'
  end

  def partners
    super
    @page = 'partners'
  end

end
