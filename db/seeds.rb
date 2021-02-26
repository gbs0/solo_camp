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
      Property.destroy_all
      puts "♻️ Destroyed all Properties"
      Ownership.destroy_all
      puts "♻️ Destroyed all Ownerships"
      Amostra.destroy_all
      puts "♻️ Destroyed all Amostras"
      Analise.destroy_all
      puts "♻️ Destroyed all Analises"
      AnaliseAmostra.destroy_all
      puts "♻️ Destroyed all AnaliseAmostras"


      file = "https://gist.githubusercontent.com/gbs0/ae18f4b60c816a917ac5887a9fb3e23c/raw/ae618c87a8736bc96cb76b6e2b1b591f517e825a/seed_solocamp.yml"
      sample = YAML.load(open(file).read)

      puts 'Creating Insumos...'
      sample["insumos"].each do |insumo|
        Insumo.create! insumo
      end
      puts '✅ Done Created Insumos!'

      puts 'Creating Adubos...'
      sample["adubos"].each do |adubo|
        # ownerships[ownership["slug"]] = Ownership.create! director.slice("name", "last_name")
        Adubo.create! adubo.slice("comercial_name", "n", "p", "k", "preco_saca")
      end
      puts '✅ Done Created Adubos!'

      puts 'Creating users...'
      admin = User.new(name: "Admin",
                    email: "test@test.com",
                    password: "password"
                    )
      admin.save!
      User.create(name: "Gabriel Schiavo",
            email: "gabriel.schiavo0@gmail.com",
            password: "password")
    
      puts "✅ Done Creating Users!"
      
      puts "Creating Ownerships..."
      Ownership.find_or_create_by(cpf: "32599122233",
                        name: "Santo Cultivo",
                        rg: "59.468.90-34",
                        cnpj: "3500024567800001",
                        email: "santocultivo@terra.com",
                        telefone: "3333-09032",
                        user_id: User.first.id
                      )
      puts "✅ Done Creating Ownerships"
      
      puts "Creating Properties..."
      Property.find_or_create_by(id: 1,
                        name: "Sitio Meu Sonho",
                        user_id: User.first.id,
                        address: "BR 116",
                        city: "Machado",
                        uf: "MG",
                        cep: 1212439,
                        cep_prefix: nil,
                        total_area: 15,
                        field_area: 5,
                        lat: 10,
                        lng: 10
                      )
      puts "✅ Done Creating Properties!"

      puts "Creating Amostras..."
      Amostra.find_or_create_by(property_id: Property.first.id,
                        user_id: User.first.id,
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
      puts "✅ Done Creating Amostras..."
  
    when 'test'
    # test-specific seeds ...
    # (Consider having your tests set up the data they need
    # themselves instead of seeding it here!)
    
    when 'production'
    # production seeds (if any) ...

end
