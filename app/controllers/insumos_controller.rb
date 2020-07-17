class InsumosController < ApplicationController
	def index
	  @insumos = Insumo.all
	end

	def new
	  respond_to do |format|
		@insumo = Insumo.new
		format.js
	  end
	end

	def create
	  @ainsumo = Insumo.new(insumo_params)
	  
	  if @insumo.save
		flash[ :notice ] = "'#{@insumo.name}' salvo."
		redirect_to insumos_path, notice: "Seu insumo foi adicionado"
	  else
		flash[:alert] = "Erro, verifque os campos digitados"
		render :new
	  end
	end
	

	private

	def insumo_params
	  params.require(:insumo).permit( :name )
	end
end
