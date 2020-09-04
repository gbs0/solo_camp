class OwnershipsController < ApplicationController
	def index
		# @onwnerships = Ownership.find(user_id: current_user.id) # Lista proprietários cadastrados do user
		@ownerships = Ownership.all
	end
	
	def new
		respond_to do |format|
		  @ownership = Ownership.new
		  format.js
		end	
	end

	def create
		@ownership = Ownership.new(ownership_params)
        @ownership.user_id = current_user.id

		if @ownership.save
			flash[ :notice ] = "'#{@ownership.name}' salvo."
			redirect_to laudos_path, notice: "A nova propriedade foi adicionado"
		else
			flash[:alert] = "Erro, verifque os campos digitados"
			render :new
			end
	end
	
	def update
	
	end

	private
	
	def ownership_params
	  params.require(:ownership).permit( :name, :cpf, :rg, :cnpj, :email, :telefone )
	end

	def get_name_params
	end

end