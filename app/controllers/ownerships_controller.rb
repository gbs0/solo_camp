class OwnershipsController < ApplicationController
	before_action :set_user, :set_ownerships

	def index
		# @onwnerships = Ownership.find(user_id: current_user.id) # Lista proprietários cadastrados do user
		#@ownerships = Ownership.where(user_id: set_user.id)
		# @ownerships = Ownership.all
		# p @ownerships
	end
	
	def new
		respond_to do |format|
		  @ownership = Ownership.new
		  format.js
		end	
	end

	def create
		@ownership = Ownership.new(ownership_params)
		@ownership.user_id = @user.id
		
		if @ownership.save
			flash[ :notice ] = "'#{@ownership.name}' salvo."
			redirect_to properties_path, notice: "Um novo proprietário foi cadastrado"
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

	def set_user
	  @user = current_user
	end

	def set_ownerships
	  @ownership = Ownership.all
	end

	def get_name_params
	
	end
end