class AnalisesController < ApplicationController
	helper_method :property
	helper_method :ownership
	helper_method :insumo

	before_action :set_user
	
	def index
	#   @analises = Analises.where(:id)
	end

	def new
	  respond_to do |format|
		  @analise = Analise.new
		  @ownerships = set_ownerships.records.sort
		  @properties = set_properties.records.sort
		  @amostras   = set_amostras.records.sort
		  @analise_amostra = AnaliseAmostra.new
			@insumos = set_insumos.sort
			format.js
		end
	end

	def create
	  # @c_user =  User.find params[:id]

	  @analise = Analise.new(analise_params)
		@analise.solicitante = current_user.name
		@analise.sku_user = current_user.ids.first
      
	  if @analise.save
			flash[ :notice ] = "'#{@analise}' salvo."
			redirect_to laudos_path, notice: "Seu laudo foi adicionado"
	  else
			flash[:alert] = "Erro, verifque os campos digitados"
			render :new
	  end
	end
	
	private

	def set_user
	  @_user = current_user
	end

	def analise_params
		params.require(:analise).permit( :name, amostras_id,  )
	end

	def set_properties
	  @_user_properties = Property.where(user_id: set_user.id)
	  p @_user_properties.class
		@_user_properties
		# @_property ||= @_user_properties.nil? ? "Você não tem nenhuma propriedade cadastrada" : @_user_properties
	end
	  
	def set_ownerships
	  @_user_ownerships = Ownership.where(user_id: set_user.id)
	  p @_user_ownerships.class
		@_user_ownerships
	#   @_ownership ||= @_user_ownerships.nil? ?  "padastrado" : @_user_ownerships
	end

  def set_amostras
		@_user_amostras = Amostra.where(user_id: set_user.id)
		@_user_amostras
	end

  def set_insumos
		@_user_insumos = Insumo.all.sort
		@_user_insumos
	end

end