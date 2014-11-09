class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  devise :omniauthable

  has_and_belongs_to_many :roles
  scope :admin, -> {joins(:roles).where("#{Role.table_name}.name" => Role.admin.name)}

  def name
    "#{self.firstname} #{self.lastname}"
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def admin
    admin?
  end

  def revokable?
    self.admin? && self.class.admin.count > 1
  end

  def deletable?
    !self.admin? || self.revokable?
  end

end
