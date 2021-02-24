require 'colorize'
namespace :health_status do
    desc "See Users db Status"
    task count_users: :environment do  
      if User.all.limit(5).empty?
        puts "0 Users on Database..".yellow 
      else
        puts User.all.limit(20000).count.to_s + " Users on Database" 
      end
    end

    desc "See Ownership db Status"
    task count_ownerships: :environment do  
      if Ownership.all.limit(5).empty?
        puts "0 Ownerships on Database".yellow 
      else
        puts Ownership.all.limit(20000).count.to_s + " Ownerships on Database" 
      end
    end

    desc "See Properties db Status"
    task count_properties: :environment do  
      if Property.all.limit(5).empty?
        puts "0 Propertys on Database..".yellow 
      else
        puts Property.all.limit(20000).count.to_s + " Properties on Database" 
      end
    end

    desc "See Amostras db Status" 
    task count_amostras: :environment do
      if Amostra.all.limit(5).empty?
        puts "0 Amostra on Database".yellow
      else  
        puts Amostra.all.limit(20000).count.to_s + " Amostras on Database" 
      end
    end

    desc "See Insumos db Status" 
    task count_insumos: :environment do
      if Insumo.all.limit(5).empty?
        puts "0 Insumos on Database".yellow
      else  
        puts Insumo.all.limit(20000).count.to_s + " Insumos on Database" 
      end
    end

    desc "See AnaliseAmostras db Status" 
    task count_analises: :environment do
      if AnaliseAmostra.all.limit(5).empty?
        puts "0 Analises on Database".yellow
      else  
        puts AnaliseAmostra.all.limit(20000).count.to_s + " Analises on Database" 
      end
    end

    desc "Run All status"
    task all: :environment do
      Rake::Task['health_status:count_users'].execute
      Rake::Task['health_status:count_ownerships'].execute 
      Rake::Task['health_status:count_properties'].execute
      Rake::Task['health_status:count_amostras'].execute
      Rake::Task['health_status:count_insumos'].execute
      Rake::Task['health_status:count_analises'].execute
    end
  end
  