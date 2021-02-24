require "open-uri"
require "yaml"
require 'pry'
# Insumo.destroy_all if Rails.env.development?
# Adubo.destroy_all if Rails.env.development?

case Rails.env
    when 'development'
      Insumo.destroy_all
      puts "♻️ Destroyed all Insumos"
      Adubo.destroy_all
      puts "♻️ Destroyed all Adubos"

      file = "https://gist.githubusercontent.com/gbs0/ae18f4b60c816a917ac5887a9fb3e23c/raw/ae618c87a8736bc96cb76b6e2b1b591f517e825a/seed_solocamp.yml"
      sample = YAML.load(open(file).read)

      puts 'Creating Insumos...'
      sample["insumos"].each do |insumo|
        Insumo.create! insumo
      end
      puts 'Done Created Insumos!'

      puts 'Creating Adubos...'
      sample["adubos"].each do |adubo|
        # ownerships[ownership["slug"]] = Ownership.create! director.slice("name", "last_name")
        Adubo.create! adubo.slice("comercial_name", "n", "p", "k", "preco_saca")
      end
      puts 'Done Created Adubos!'

      puts 'Creating users...'
      User.find_or_create_by(name: "Gabriel Schiavo",
                       email: "gabriel.schiavo0@gmail.com",
                       encrypted_password: "password")


      User.find_or_create_by(name: "Admin",
                        email: "test@test.com",
                        encrypted_password: "password")
      puts "Done Creating Users!"
      
      puts "Creating Ownerships..."
      Ownership.find_or_create_by(cpf: "32599122233",
                        name: "Barões da Pisadinha",
                        rg: "59.468.90-34",
                        cnpj: "3500024567800001",
                        email: "terradecultivo@terra.com",
                        telefone: "3333-09032",
                      )
      puts "Done Creating Ownerships"
      
      puts "Creating Properties..."
      Property.find_or_create_by(id: 1,
                        name: "Sitio Meu Sonho",
                        ownership_id: 1,
                        user_id: 1,
                        address: "BR 116",
                        city: "Machado",
                        uf: "MG",
                        cep: 1212439,
                        cep_prefix: nil,
                        area: 10
                      )
      puts "Done Creating Properties!"

      puts "Creating Amostras..."
      Amostra.find_or_create_by(property_id: 1,
                        user_id: 1,
                        profundidade: 20,
                        compactacao: 300,
                        peso: 400,
                        argila: 0.1e2,
                        potassio: 0.11e2,
                        calcario: 0.1e2,
                        magnesio: 0.1e2,
                        enxofre20: 0.1e1,
                        enxofre40: 0.2e2,
                        hidrogenio: 0.1e2,
                        alcalinidade: 0.1e2,
                        boro: 0.1e2,
                        cobre: 0.1e2,
                        manganes: 0.1e2,
                        zinco: 0.1e2,
                        carbono: 0.2e2,
                        materia: nil,
                        valor: nil,
                        ctc: nil        
                      )
      puts "Done Creating Amostras..."
  
    when 'test'
    # test-specific seeds ...
    # (Consider having your tests set up the data they need
    # themselves instead of seeding it here!)
    
    when 'production'
    # production seeds (if any) ...

end
