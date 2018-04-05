class CreateVoces < ActiveRecord::Migration[5.1]
  def change
    create_table :voces do |t|
      t.string :email
      t.string :nombres
      t.string :apellidos
      t.datetime :fechacarga
      t.string :observaciones
      t.string :estadovoz, default: 'En Proceso'
      t.string :archivooriginal
      t.string :archivoconvertido
      t.references :concurso, foreign_key: true

      t.timestamps
    end
  end
end
