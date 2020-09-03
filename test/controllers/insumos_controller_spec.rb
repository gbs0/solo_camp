require 'rails_helper'
begin
  require "insumos_controller"
rescue LoadError
end

if defined?(InsumosController)
  RSpec.describe InsumosController, :type => :controller do
  
    let(:valid_attributes) do
    {
        name: "Insumo1"
    }

  end
end