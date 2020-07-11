class InsumosController < ApplicationController
	def index
		@insumos = Insumo.all
	end

	def new
	end

	
end
