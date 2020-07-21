class LaudossController < ApplicationController
	def index
	  # @laudos = Laudos.where(:id)
	end

	def new
      @laudo = Laudo.new
	end

	def create
	  @laudo = Laudo.new(laudo_params)
      @laudo.solicitante = current_user.name
      @laudo.sku_user
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
end
