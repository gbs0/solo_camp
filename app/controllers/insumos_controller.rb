class InsumosController < ApplicationController
	def index
		@insumos = Insumo.all
	end
end
