class AnalisesController < ApplicationController
	helper_method :property
	helper_method :ownership
	helper_method :insumo
	
	def index
	#   @analises = Analises.where(:id)
	end

	def new
	  respond_to do |format|
		@analise = Analise.new
		@ownership = ownership
		@property = property
		puts @ownership
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

	def analise_params
		params.require(:analise).permit( :name )
	end

	def property
	  @_property ||= @_property ? Property.find(params[:id]) : Property.new(params[:property])
	end
	  
	def ownership
	  @_ownership ||= Ownerships.where(user_id: id)
	end
end
