class PropertiesController < ApplicationController
	before_action :set_user

	def index
		# Listar propriedades do current_user
		@properties = Property.all
	end
	
	def new
	  respond_to do |format|
		@property = Property.new
		format.js
	  end	
	end

	def create
		@property = Property.new(property_params)
		p @property.user_id = @user.id
		# @property.ownership => Igual ao ownership assimilado no params.require( :name, :last_name)
		if @property.save
		  flash[ :notice ] = "'#{@property.name}' salvo."
		#   redirect_to laudos_path, notice: "A nova propriedade foi adicionado"
		else
		  flash[:alert] = "Erro, verifque os campos digitados"
		  render :new
		end
	end
	
	def update
	  @property.update(property_params)
	end

	private
	
	def property_params
	  params.require(:property).permit( :name, :address, :city, :uf, :cep, :area )
	end

	def set_user
	  @user = current_user
	end 
	def get_name_params
	end

end