ActiveAdmin.register Tarea do
	scope :all, :default => true
	scope :finalizan_esta_semana do |tareas|
  tareas.where('fecha_limite > ? and fecha_limite < ?', Time.now, 1.week.from_now)
	end
	scope :retrasados do |tareas|
	  tareas.where('fecha_limite < ?', Time.now)
	end
	scope :mias do |tareas|
	  tareas.where(:admin_user_id => current_admin_user.id)
	end
 
 show do
  panel "Detalles de la tarea" do
    attributes_table_for tarea do
      row("Status") { status_tag (tarea.completa ? "Completa" : "Pendiente"), (tarea.completa ? :ok : :error) }
      row('Titulo') { tarea.titulo }
      row("Proyecto") { link_to tarea.proyecto.titulo, admin_proyecto_path(tarea.proyecto) }
      row("Asignada a") { link_to tarea.admin_user.email, admin_admin_user_path(tarea.admin_user) }
      row("Fecha Limite") { tarea.fecha_limite? ? l(tarea.fecha_limite, :format => :long) : '-' }
    end
  end
 
  active_admin_comments
	end

	sidebar "Otras tareas de este usuario", :only => :show do
	  table_for current_admin_user.tareas.where(:proyecto_id => tarea.proyecto) do |t|
	    t.column("Status") { |tarea| status_tag (tarea.completa ? "Completa" : "Pendiente"), (tarea.completa ? :ok : :error) }
	    t.column('Titulo') { |tarea| link_to tarea.titulo, admin_tarea_path(tarea) }
	  end
	end
end
