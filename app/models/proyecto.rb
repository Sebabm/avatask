class Proyecto < ActiveRecord::Base
	has_many :tareas
  attr_accessible :titulo
  validates :titulo, :presence => true

end
