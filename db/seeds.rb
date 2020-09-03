require "open-uri"
require "yaml"

# Insumo.destroy_all if Rails.env.development?
# Adubo.destroy_all if Rails.env.development?

case Rails.env
    when 'development'
      Insumo.destroy_all
      puts "♻️ Destroyed all insumos"
      Adubo.destroy_all
      puts "♻️ Destroyed all adubos"

      file = "https://gist.githubusercontent.com/gbs0/ae18f4b60c816a917ac5887a9fb3e23c/raw/ae618c87a8736bc96cb76b6e2b1b591f517e825a/seed_solocamp.yml"
      sample = YAML.load(open(file).read)

      puts 'Creating Insumos...'
      sample["insumos"].each do |insumo|
        Insumo.create! insumo
      end
      puts 'Created Insumos...'

      puts 'Creating Adubos...'
      sample["adubos"].each do |adubo|
        # ownerships[ownership["slug"]] = Ownership.create! director.slice("name", "last_name")
        Adubo.create! adubo.slice("comercial_name", "n", "p", "k", "preco_saca")
      end
      puts 'Created Adubos...'

    
    when 'test'
    # test-specific seeds ...
    # (Consider having your tests set up the data they need
    # themselves instead of seeding it here!)
    
    when 'production'
    # production seeds (if any) ...

end
