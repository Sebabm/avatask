class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.integer :proyecto_id
      t.integer :admin_user_id
      t.string :titulo
      t.boolean :completa
      t.date :fecha_limite

      t.timestamps
    end
  end
end
