class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :role
  has_one :profile
  belongs_to :tab
  has_many :customers
  before_create :set_default_role
  after_create :default_profile
 

  def set_admin
   role = Role.find_by_name('admin')
   self.role = role
   self.save!
  end 

  def assign_role_tab
   role = Role.find_by_name('tab')
   self.role = role
   self.save!
  end 

  def admin?
    self.role.name=='admin'
  end

  def tab?
    self.role.name=='tab'
  end

  private

  def default_profile
    Profile.create(user_id: self.id)
  end

  def set_default_role
    self.role ||= Role.find_by_name('moderator')
  end


end
