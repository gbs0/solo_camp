require 'colorize'

namespace :reset_db do
  desc "Reset all db data"
  task all: :environment do 
    User.destroy_all
    puts "♻️ Destroyed all Users"
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
  end
end