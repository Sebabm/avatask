ActiveAdmin.register Proyecto do
	index do
		column :titulo do |proyecto|
    	link_to proyecto.titulo, admin_proyecto_path(proyecto)
  	end
 		default_actions
	end
 
# Filter only by titulo
filter :titulo

	
	show :titulo => :titulo do
	  panel "Tareas" do
	    table_for proyecto.tareas do |t|
	      t.column("Status") { |tarea| status_tag (tarea.completa ? "Completa" : "Pendiente"), (tarea.completa ? :ok : :error) }
	      t.column('Titulo') { |tarea| link_to tarea.titulo, admin_tarea_path(tarea) }
	      t.column("Asignada a") { |tarea| tarea.admin_user.email }
	      t.column("Completa") { |tarea| tarea.completa? ? l(tarea.completa, :format => :long) : '-' }
	    end
	  end
	end 

end
