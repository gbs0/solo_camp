class CreateLaudos < ActiveRecord::Migration[5.1]
    def change
        create_table :laudos do |t|
        t.string :solicitante # Nome do Tecnico @current_user.name
        
        # Referencia / Tabela Propriedades
        # t.string :proprietario # Nome do Proprietario @propriedade.proprietario
        # t.references :propriedade # Referencia da tabela propriedades
        
        # Referencia / Tabela  Resultados Quimicos
        t.references :resultados_quimicos

        # Referencia  / Tabela Indicadores_saturacao
        t.references :indicadores_saturacao

        # Referencia  / Tabela Disponibilidade no Solo
        t.references :disponibilidade_solo

        t.timestamps
        end
    end
end