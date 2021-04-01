class AnalisesController < ApplicationController
	helper_method :property
	helper_method :ownership
	helper_method :insumo

	before_action :set_user
	before_action :set_properties, :set_ownerships, :set_amostras_for_properties, :set_insumos, only: [:index]

	def index
		@analise = Analise.new
	end

	def new
		@analise = Analise.new
		@ownerships = set_ownerships.records.sort
		@property = set_property
		@amostras = set_amostras.records.sort
		@insumos = set_insumos.sort
		# @analise_amostra = AnaliseAmostra.new
	end

	def create
	  @analise = Analise.new
	
	  build_analise_attrs

	  _amostras = amostras_params.reject!(&:empty?)
	  @amostras_reference = Amostra.by_ids(_amostras)
	
	  raise
	  
	  if @analise.save
			flash[ :notice ] = "'#{@analise}' salvo."
			redirect_to laudos_path, notice: "Seu laudo foi adicionado"
	  else
			flash[:alert] = "Erro, verifque os campos digitados"
			render :new
	  end
	end

	def show_analise_form
	   render partial: 'new'
	end
	
	private
	
	def analise_params
		params.require(:analise).permit( :property, :ownership, :insumo )
	end

	def amostras_params
		params[:amostra][:amostras]
	end

	def breadcrumb_params
		params.permit( :utf8 )
	end

	def set_user
	  @user = current_user
	end

	def set_property
	  _params_property = Property.where(id: params[:property])
	  @property ||= _params_property.nil? ?  [] : _params_property
	end
	
	def set_properties
	  _user_properties = Property.where(user_id: set_user.id)
	  @properties ||= _user_properties.nil? ? [] : _user_properties
	end
	

	def set_ownerships
	  user_ownerships = Ownership.where(user_id: set_user.id)
	  @ownerships ||= user_ownerships.nil? ? [] : user_ownerships
	  #   p @_user_ownerships.class
	  # 	@_user_ownerships
	  #   @_ownership ||= @_user_ownerships.nil? ?  "padastrado" : @_user_ownerships
	end

  def set_amostras_for_user
	# @_user_amostras = Amostra.where(user_id: set_user.id)
	# @_user_amostras
  end

  def set_amostras_for_properties
	_properties_amostras =  Amostra.joins(:property).where(property_id: @properties.map(&:id)) unless @properties.nil?
	@amostras ||= _properties_amostras.nil? ?  [] : _properties_amostras.to_a
  end



  def set_insumos
	_user_insumos = Insumo.all.sort
	@insumos ||= _user_insumos.nil? ? [] : _user_insumos
  end

  def build_analise_attrs
	@analise.user_id = current_user.id
	@analise.solicitante = current_user.name
	
	@analise.property_id = Property.by_id(analise_params[:property]).id
	@analise.property_name = Property.by_id(analise_params[:property]).name
	
	@analise.ownership_id = Ownership.by_id(analise_params[:ownership]).id
	@analise.owner_name = Ownership.by_id(analise_params[:ownership]).name

	@analise.insumo_id = Insumo.by_id(analise_params[:insumo]).id
	@analise.insumo_name = Insumo.by_id(analise_params[:insumo]).name
  end

end