class PropertiesController < ApplicationController
	before_action :set_user, :set_ownerships

	def index
		# Listar propriedades do current_user
		@properties = Property.where(user_id: @user.id)
	end
	
	def new
	  respond_to do |format|
		@property = Property.new
		format.js
	  end	
	end

  def edit
		# respond_to do |format|
		# 	format.js
		# 	@property = Property.find(params[:id])
		# 	if @property.update(property_params)
		# 		redirect_to properties_path, notice: "Propriedade editada com sucesso."
		# 	else
		# 		flash[:alert] = "Propriedade não editada, verifique os erros."
		# 	end
		# end

	end

	def create
		@property = Property.new(property_params)
		p @property.user_id = @user.id
		# @property.ownership => Igual ao ownership assimilado no params.require( :name, :last_name)
		if @property.save
		  flash[ :notice ] = "'#{@property.name}' salvo."
		  redirect_to properties_path, notice: "A nova propriedade foi adicionado"
		else
		  flash[:alert] = "Erro, verifque os campos digitados"
		  render :new
		end
	end

	def show
	  @property = Property.find(params[:id])
	end
	
	def update
		@property = Property.find(params[:id])
		if @property.update(property_params)
			redirect_to properties_path, notice: "Propriedade editada com sucesso."
		else
			flash[:alert] = "Propriedade não editada, verifique os erros."
		end
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

	def set_ownerships
	  @ownerships = Ownership.where(user: @user)
	end

end