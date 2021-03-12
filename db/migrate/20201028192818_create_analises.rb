class CreateAnalises < ActiveRecord::Migration[5.1]
  def change
    create_table :analises do |t|
      t.string :solicitante
      t.references :user,      foreign_key: true
      t.references :property,  foreign_key: true
      t.references :ownership, foreign_key: true
      t.references :insumo,    foreign_key: true
      t.string :owner_name,    default: ""
      t.string :property_name, default: ""
      t.string :insumo_name,   default: ""
      t.jsonb :coordinates,    default: {}
      
      t.timestamps
    end
  end
end
