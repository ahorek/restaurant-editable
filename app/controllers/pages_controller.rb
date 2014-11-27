class PagesController < ApplicationController

  def index
    @templates = Template.where(:page => 'index')
  end

  def events
    @templates = Template.where(:page => 'events')
  end

  def about
    @templates = Template.where(:page => 'about')
  end

  def contact
    @templates = Template.where(:page => 'contact')
  end

  def gallery
    @templates = Template.where(:page => 'gallery')
  end

  def menu
    @templates = Template.where(:page => 'menu')
  end

  def partners
    @templates = Template.where(:page => 'partners')
  end

end
