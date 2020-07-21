class CreateLaudos < ActiveRecord::Migration[5.1]
    def change
        create_table :laudos do |t|
        # Referencias do usuario atual
        t.string :solicitante # Nome do Tecnico @current_user.first_name && last_name
        t.references :user, foreign_key: true # Referencia do usuario @current_user.ids.first
    
        # Referencia / Tabela Propriedades
        t.references :property, foreign_key: true
        t.string :proprietario
        
        # t.string :proprietario # Nome do Proprietario @propriedade.proprietario
        # t.references :propriedade # Referencia da tabela propriedades
        
        # Referencia / Tabela de insumos
        t.references :insumo, foreign_key: true
        
        # Referencia / Tabela  Resultados Quimicos
        # t.references :resultados_quimicos, foreign_key: true

        # # Referencia  / Tabela Indicadores_saturacao
        # t.references :indicadores_saturacao, foreign_key: true 

        # # Referencia  / Tabela Disponibilidade no Solo
        # t.references :disponibilidade_solo, foreign_key: true

        t.timestamps
        end
    end
end