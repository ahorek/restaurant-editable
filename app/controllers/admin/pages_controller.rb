class Admin::PagesController < PagesController

  before_filter :require_admin
  layout "admin"

  include LanguagesHelper

  def settings
    @fb_setting = Setting.where(:name => 'facebook_url').first
    @ms_setting = {}
    available_languages.each do |lang|
      @ms_setting[lang] = Setting.where(:name => "menu_sublinks_#{lang}").first
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

  def contact
    super
    @page = 'contact'
  end

  def gallery
    super
    @page = 'gallery'
  end

end
