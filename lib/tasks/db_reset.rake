namespace :db_reset do
  desc "Reset Analise Amostra in database"
    task analise_amostras: :environment do
      AnaliseAmostra.destroy_all
      puts "♻️ Destroyed all AnaliseAmostras"
    end
  
  desc "Reset Analises in database"
    task analises: :environment do
      Analise.destroy_all
      puts "♻️ Destroyed all Analises"
    end

  desc "Reset Amostras in database"
    task amostras: :environment do
      Amostra.destroy_all
      puts "♻️ Destroyed all Amostras"
    end
  
  desc "Reset Properties in database"
    task properties: :environment do
      Property.destroy_all
      puts "♻️ Destroyed all Property"
    end

  desc "Reset Ownerships in database"
    task onwnerships: :environment do
      Ownership.destroy_all
      puts "♻️ Destroyed all Ownerships"
    end
  
  desc "Reset Insumos in database"
    task insumos: :environment do
      Insumo.destroy_all
      puts "♻️ Destroyed all Insumos"
    end
  
  desc "Reset Users in database"
    task users: :environment do
      User.destroy_all
      puts "♻️ Destroyed all Users"
    end
  
  desc "Run All status"
    task all: :environment do
      Rake::Task['db_reset:analise_amostras'].execute
      Rake::Task['db_reset:analises'].execute
      Rake::Task['db_reset:properties'].execute
      Rake::Task['db_reset:amostras'].execute
      Rake::Task['db_reset:ownerships'].execute
      Rake::Task['db_reset:insumos'].execute
      Rake::Task['db_reset:users'].execute
    end
end