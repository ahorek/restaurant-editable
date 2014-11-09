class CreateAdminUser < ActiveRecord::Migration

  def self.up
    u = User.create(:email => 'admin@admin.com', :password => '123456', :firstname => 'admin', :lastname => 'admin')
    u.make_admin
  end

  def self.down
  end

end
