class PropertiesController < ApplicationController
	before_action :set_user, :set_ownerships
	before_action :set_properties, only: [:index]
  
	before_action :set_property, :set_weather, :set_timestamps, :show_map, only: :show
	
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
		
		if @property.save
			redirect_to properties_path, flash: {success: "Propriedade adicionada com sucesso!"}
		else
			render 'new', flash: {notice: "Verifique os erros"}
		end
		
	end
	
	def show
		_id = @property.id
		_amostras = Amostra.by_property(_id)
		@amostras_quantity = _amostras.count
		_ultima_amostra = _amostras.last.updated_at unless _amostras.empty?
		@amostra_timestamp = Timezone.date_threshold(_ultima_amostra.to_s) unless _ultima_amostra.nil?
		
		_analises = Analise.by_property(_id)
		@analises_quantity = _analises.count
		_utlima_analise = _analises.last.updated_at unless _analises.empty?
		@analise_timestamp = Timezone.date_threshold(_utlima_analise.to_s) unless _utlima_analise.nil?
		
	end
	
	def update
		@property = Property.find(params[:id])
		
		if @property.update(property_params)
			redirect_to properties_path, flash: {success: "Propriedade editada com sucesso!"}
		else
			render 'edit', flash: {notice: "Verifique os erros"}
		end
	end
	
	def destroy
		@property = Property.find(params[:id])
		
		if @property.destroy
			redirect_to properties_path, flash: {success: "Propriedade excluida com sucesso!"}
		end
		
	end
	
	private
	
	def property_params
		params.require(:property).permit( :name, :address, :city, :uf, :cep, :total_area )
	end
	
	def set_property
	  @property = Property.find(params[:id])
	  @lat = @property.lat
	  @lng = @property.lng
	  @formatted_address = @property.formatted_address
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
	
	def set_weather_in_properties
		@properties.each do |property|
			_lat = Property.convert_coordinates(property.lat)
			_lng = Property.convert_coordinates(property.lng)
			@response = ClimaCell.call(_lat, _lng)
		end
	end
	
	def set_weather
		@response = ClimaCell.call(@lat, @lng) unless @lat.blank? && @lng.blank?
		puts @response
		@threshold_timestamp = ClimaCell.threshold_timestamp(@response)
		@end_time = ClimaCell.timestamp(@response)
		@celsius = ClimaCell.celsius(@response)
	end
	
	def set_timestamps
		@timezone_location = Timezone.zone(@property)
		@weather_timezone = Timezone.timestamp(@end_time) unless @end_time.blank?
		@updated_in = Timezone.datetime(@property.updated_at.to_s)
		@created_in = Timezone.datetime(@property.created_at.to_s)
		@updated_threshold = Timezone.date_threshold(@property.updated_at.to_s)
	end

	def show_map
	  @map = Maps.call(@lat, @lng) unless @lat.blank?
	end
end