class AdminUser < ActiveRecord::Base
  has_many :tareas
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  after_create { |admin| admin.send_reset_password_instructions }
 
	def password_required?
 		new_record? ? false : super
	end
end
