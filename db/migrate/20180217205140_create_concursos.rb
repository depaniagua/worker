class CreateConcursos < ActiveRecord::Migration[5.1]
  def change
    create_table :concursos do |t|

      t.string :nombre
      t.string :image
      t.string :url
      t.datetime :fechainicio
      t.datetime :fechafin
      t.string :valorpagar
      t.string :texto
      t.string :recomendaciones

      t.timestamps
    end
  end
end