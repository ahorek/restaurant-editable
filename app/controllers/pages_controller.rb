class PagesController < ApplicationController

  def index
    get_tempates('index')
  end

  def events
    get_tempates('events')
  end

  def about
    get_tempates('about')
  end

  def contact
    get_tempates('contact')
  end

  def partners
    get_tempates('partners')
  end

  def gallery1
    get_tempates('gallery1')
  end

  def gallery2
    get_tempates('gallery2')
  end

  def menu1
    get_tempates('menu1')
  end

  def menu2
    get_tempates('menu2')
  end

  def menu3
    get_tempates('menu3')
  end

  def menu4
    get_tempates('menu4')
  end

  private

  def get_tempates(page)
    @templates = Template.where(:page => page)
  end

end
