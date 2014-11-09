class Template < ActiveRecord::Base

  validates :language, :page, :presence => true

end
