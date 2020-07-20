class CreateLaudos < ActiveRecord::Migration[5.1]
    def change
        create_table :laudos do |t|
        t.string :solicitante # Nome do Tecnico @current_user.name
        
        # Referencia / Tabela Propriedades
        # t.string :proprietario # Nome do Proprietario @propriedade.proprietario
        # t.references :propriedade # Referencia da tabela propriedades
        t.references :insumo, foreing_key: true
        # Referencia / Tabela  Resultados Quimicos
        t.references :resultados_quimicos, foreing_key: true

        # Referencia  / Tabela Indicadores_saturacao
        t.references :indicadores_saturacao, foreing_key: true 

        # Referencia  / Tabela Disponibilidade no Solo
        t.references :disponibilidade_solo, foreing_key: true

        t.timestamps
        end
    end
end