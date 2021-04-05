class AnalisesController < ApplicationController
	helper_method :property
	helper_method :ownership
	helper_method :insumo

	before_action :set_user
	before_action :set_properties, :set_ownerships, :set_amostras_for_properties, :set_insumos, only: [:index]

	def index
		@analise = Analise.new
		@analises = Analise.by_user(@user.id)
	end

	def new
		@analise = Analise.new
		@ownerships = set_ownerships.records.sort
		@property = set_property
		@amostras = set_amostras.records.sort
		@insumos = set_insumos.sort
	end

	def create
	  @analise = Analise.new 
	
	  @analise.build({
		  	user_id: 	current_user.id, 
			name: 		current_user.name, 
			property: 	analise_params[:property],
			ownership: 	analise_params[:ownership],
			insumo: 	analise_params[:insumo]
	  })
	  	  
	  if @analise.save
			digest_amostras(@analise)
			# CreateAnaliseAmostraJob.perform_later(current_user, @analise, @amostras_reference)  # <- The job is queued
			flash[ :notice ] = "'#{@analise}' salvo."
			redirect_to analises_path, notice: "Sua análise foi adicionada"
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

  def digest_amostras(analise)
	_amostras = amostras_params.reject!(&:empty?)
	@amostras_reference = Amostra.by_ids(_amostras)

	@amostras_reference.each do |amostra|
	  analise_de_campo = AnaliseAmostra.new
	  analise_de_campo.build({
		current_user: current_user,
		analise: analise, 
		amostras: amostra,
		insumo: analise.insumo_name
	  })
	  analise_de_campo.save
	end
  end

end