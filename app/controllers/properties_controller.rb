class PropertiesController < ApplicationController
	before_action :set_user, :set_ownerships
	before_action :set_properties, only: [:index]
	
	def index; end
	
	def new
	  respond_to do |format|
		@property = Property.new
		format.js
	  end	
	end

  def edit
	@property = Property.find(params[:id])
  end

	def create
		@property = Property.new(property_params)
		@property.user_id = set_user.id

		@property.save

		# if @property.save
		#   flash[ :notice ] = "'#{@property.name}' salvo."
		#   redirect_to properties_path, notice: "A nova propriedade foi adicionado"
		# else
		#   flash[:alert] = "Erro, verifque os campos digitados"
		#   render :new
		# end
		rescue => e
			@error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to properties_path, flash: {success: "Propriedade adicionada com sucesso!"} }
			end
	end

	def show
	  @property = Property.find(params[:id])
	end
	
	def update
		@property = Property.find(params[:id])
		@property.update!(property_params)
		# if @property.update(property_params)
		# 	redirect_to properties_path, notice: "Propriedade editada com sucesso."
		# else
		# 	flash[:alert] = "Propriedade não editada, verifique os erros."
		# end
		rescue => e
			@error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to properties_path, flash: {success: "Propriedade editada com sucesso!"} }
			end
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy!
		
		rescue => e
			@error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to properties_path, flash: {success: "Propriedade excluida com sucesso!"} }
			end
	end

	private
	
	def property_params
	  params.require(:property).permit( :name, :address, :city, :uf, :cep, :total_area )
	end

	def set_user
	  @user = current_user
	end
	 
	def get_name_params
	end

	def set_ownerships
	  @ownerships = Ownership.where(user: @user)
	end

	def set_properties
	  @properties = Property.where(user_id: @user.id)
	end

	def set_weather
		@properties.each do |property|
			_lat = Property.convert_coordinates(property.lat)
			_lng = Property.convert_coordinates(property.lng)
			@response = ClimaCell.call(_lat, _lng)
		end
	end
	
end