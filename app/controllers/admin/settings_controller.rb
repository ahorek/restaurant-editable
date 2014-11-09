class Admin::SettingsController < ApplicationController

  before_filter :require_admin
  layout "admin"

  def create_or_update
    failed = false
    if params[:setting] && params[:setting].is_a?(Hash)
      settings = (params[:setting] || {}).dup.symbolize_keys
      Setting.transaction do
        settings.each do |name, value|
          value.delete_if{|v| v.blank? } if value.is_a?(Array)
          set = Setting.where(:name => name.to_s).first
          set = Setting.new(:name => name.to_s) if set.nil?
          set.value = value
          failed = set unless set.save
        end
      end
    end

    respond_to do |format|
      format.json { failed ? render_json_errors(failed) : render_status_ok }
    end
  end

end
