class TemplatesController < ApplicationController

  before_filter :find_template, :only => [:modal, :update]

  def show
    @template = Template.where(:id => params[:id]).first
    respond_to do |format|
      format.html
    end
  end

  def modal
    @template ||= Template.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @template = Template.new(params[:template].permit(:description, :language, :page))
    if @template.save
      redirect_to_back_or_default index_pages_path(:notice => t(:notice_created))
    else
      format.html { redirect_back_or_default index_pages_path(:alert => @template.errror.messages.join('<br>').to_s) }
      format.json { render_json_errors(@template) }
    end
  end

  def update
    if @template.update_attributes(params[:template].permit(:description, :language, :page))
      respond_to do |format|
        format.html { redirect_to_back_or_default index_pages_path(:notice => t(:notice_updated)) }
        format.json { render_status_ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to_back_or_default index_pages_path(:alert => @template.errror.messages.join('<br>').to_s) }
        format.json { render_json_errors(@template) }
      end
    end
  end

  private

  def find_template
    if params[:template]
      @language = params[:template][:language]
      @page = params[:template][:page]
      @template = Template.where(:language => @language, :page => @page).first
    end
  end

end