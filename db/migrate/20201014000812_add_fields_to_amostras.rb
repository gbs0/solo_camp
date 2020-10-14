class AddFieldsToAmostras < ActiveRecord::Migration[5.1]
  def change
    add_column :amostras, :argila, :decimal
    add_column :amostras, :potassio, :decimal
    add_column :amostras, :calcario, :decimal
    add_column :amostras, :magnesio, :decimal
    add_column :amostras, :enxofre20, :decimal
    add_column :amostras, :enxofre40, :decimal
    add_column :amostras, :hidrogenio, :decimal
    add_column :amostras, :alcalinidade, :decimal
    add_column :amostras, :boro, :decimal
    add_column :amostras, :cobre, :decimal
    add_column :amostras, :manganes, :decimal
    add_column :amostras, :zinco, :decimal
    add_column :amostras, :carbono, :decimal
    add_column :amostras, :materia, :decimal
    add_column :amostras, :valor, :decimal
    add_column :amostras, :ctc, :decimal
  end
end
