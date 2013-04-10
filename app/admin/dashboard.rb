ActiveAdmin::Dashboards.build do
  section "Tus tareas para esta semana" do
    table_for current_admin_user.tareas.where('fecha_limite > ? and fecha_limite < ?', Time.now, 1.week.from_now) do |t|
      t.column("Status") { |tarea| status_tag (tarea.is_done ? "Done" : "Pending"), (tarea.is_done ? :ok : :error) }
      t.column('Titulo') { |tarea| link_to tarea.title, admin_tarea_path(tarea) }
      t.column("Asignada a") { |tarea| tarea.admin_user.email }
      t.column("Fecha Limite") { |tarea| tarea.fecha_limite? ? l(tarea.fecha_limite, :format => :long) : '-' }
    end
  end
 
  section "Tares que estan atrasadas" do
    table_for current_admin_user.tareas.where('fecha_limite < ?', Time.now) do |t|
      t.column("Status") { |tarea| status_tag (tarea.is_done ? "Done" : "Pending"), (tarea.is_done ? :ok : :error) }
      t.column('Titulo') { |tarea| link_to tarea.title, admin_tarea_path(tarea) }
      t.column("Asignada a") { |tarea| tarea.admin_user.email }
      t.column("Fecha Limite") { |tarea| tarea.fecha_limite? ? l(tarea.fecha_limite, :format => :long) : '-' }
    end
  end
end
