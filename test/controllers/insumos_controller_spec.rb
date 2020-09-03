require 'rails_helper'
begin
  require "insumos_controller"
rescue LoadError
end

if defined?(InsumosController)
  RSpec.describe InsumosController, :type => :controller do
  
    let(:valid_attributes) do
      {
        name: "Banana"
      }
    end

    let(:invalid_attributes) do
    {
      { name: "" }
    }

    describe "GET index" do
      it "Assimila todos os insumos como @insumo" do
        insumo = Insumo.create! valid_attributes
        get :index, params: {}
        expect(assigns(:insumos)).to eq([insumo])
      end
    end

    
  end
end