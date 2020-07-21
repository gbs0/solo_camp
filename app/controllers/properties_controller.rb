class PropertiesController < ApplicationController
	def index
		# Listar propriedades do current_user
	end
	
	def new
		@property = Property.new()	
	end

	def create
	
	end
	
	def update
	
	end

	private
	
	def property_params
	  params.require(:property).permit( :name )
	end

end