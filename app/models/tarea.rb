class Tarea < ActiveRecord::Base
  attr_accessible :admin_user_id, :completa, :fecha_limite, :proyecto_id, :titulo
  belongs_to :proyecto
  belongs_to :admin_user
 
  validates :titulo, :proyecto_id, :admin_user_id, :presence => true
  validates :completa, :inclusion => { :in => [true, false] }
end
