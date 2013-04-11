class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  before_create :assign_role
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :account_active, :role_ids
  # attr_accessible :title, :body

  validates :name, presence: true
  validates :name, :email, uniqueness: {case_sensitive: false}
  scope :include_user_roles, include: [:roles]
  scope :alphabetical, self.order(:name)
  scope :all_users, self.alphabetical
  scope :admins, self.alphabetical.select{|user| user.name if user.has_role? :admin}
  scope :chemists, self.alphabetical.select{|user| user.name if user.has_role? :chemist}
  scope :editors, self.alphabetical.select{|user| user.name if user.has_role? :editor}  

  def user_roles
    #return self.roles.first.name.capitalize
    #return self.roles.collect(&:name).join(", ")
    return self.roles.collect{|role| role.name.capitalize}.join(", ")
  end

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && account_active?
  end

  def as_xls(options = {})
    {
      "Name" => name,
      "E-Mail" => email,
      "Role" => self.roles.first.name.capitalize,
      "Active" => account_active? ? "Yes" : "No"
    }
  end

  define_index do
    indexes name, sortable: true
    indexes email
    indexes roles(:name), as:  :role_name
    indexes account_active
    set_property delta: true
  end

  private

  def assign_role
    self.role_ids = Role.find_by_name("chemist").id
  end


end
