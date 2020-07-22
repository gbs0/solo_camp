class LaudosController < ApplicationController
	helper_method :property
	helper_method :ownership
	helper_method :insumo
	
	def index
	  # @laudos = Laudos.where(:id)
	end

	def new
      @laudo = Laudo.new
	end

	def create
	  # @c_user =  User.find params[:id]

	  @laudo = Laudo.new(laudo_params)
      @laudo.solicitante = current_user.name
      @laudo.sku_user = current_user.ids.first
      
	  if @laudo.save
		flash[ :notice ] = "'#{@laudo.name}' salvo."
		redirect_to laudos_path, notice: "Seu laudo foi adicionado"
	  else
		flash[:alert] = "Erro, verifque os campos digitados"
		render :new
	  end
	end
	
	private

	def laudo_params
		params.require(:laudo).permit( :name )
	end

	def category
	  @_category ||= params[:id] ? Category.find(params[:id]) : Category.new(params[:category])
	end
	  
	def post
	  @_post ||= Post.new(params[:post])
	end

	
end
