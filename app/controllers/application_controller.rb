class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_locale

  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

  def render_json_errors(entities)
    if entities.is_a?(Array)
      @error_messages = entities.map {|entity| entity.errors.full_messages}.flatten
    else
      @error_messages = entities.errors.full_messages
    end
    render :text => {:errors => @error_messages}.to_json, :status => :unprocessable_entity, :layout => false
  end

  def render_status_ok
    render :text => '{}', :status => :ok, :layout => false # head :no_content
  end

  def redirect_to_back_or_default(default = root_url)
    if request.env["HTTP_REFERER"].present? && request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end

  protected

  def require_admin
    unless current_user.try(:admin?)
      render404 and return false
    end
  end

  private

  def set_locale
    lang = params[:locale] if params[:locale].present?
    lang ||= request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if request.env['HTTP_ACCEPT_LANGUAGE']
    lang ||= ''
    if lang.match /^(en|cs|pl|de)$/
      I18n.locale = lang.to_sym
    else
      I18n.locale = I18n.default_locale
    end
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end


end
