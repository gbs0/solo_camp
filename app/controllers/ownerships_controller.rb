class OwnershipsController < ApplicationController
	before_action :set_user, :set_ownerships
  before_action :set_ownership, only: :edit

	def index
		# @onwnerships = Ownership.find(user_id: current_user.id) # Lista proprietários cadastrados do user
		#@ownerships = Ownership.where(user_id: set_user.id)
		# @ownerships = Ownership.all
		# p @ownerships
	end
  def edit; end

	def new
		respond_to do |format|
		  @ownership = Ownership.new
		  format.js
		end	
	end

	def create
		@ownership = Ownership.new(ownership_params)
		@ownership.user_id = @user.id
		
		@ownership.save
		if @ownership.save
			flash[ :notice ] = "'#{@ownership.name}' salvo."
			redirect_to properties_path, notice: "Um novo proprietário foi cadastrado"
		else
			flash[:alert] = "Erro, verifque os campos digitados"
			render :new
		end
	end
	
	def show 
	  @ownership = Ownership.find(params[:id])
	end

	def update
		@ownership = Ownership.find(params[:id])
		
		@ownership.update!(ownership_params)

		rescue => e
			@error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to properties_path, flash: {success: "Proprietário(a) editado com sucesso!"} }
			end

		# if @ownership.update(ownership_params)
		# 	redirect_to properties_path, notice: "Proprietário editado com sucesso."
		# else
		# 	flash[:alert] = "Proprietário não editado, verifique os erros."
		# end
	end

	def destroy
	  @ownership = Ownership.find(params[:id])
	  if @ownership.destroy
		redirect_to properties_path 
	  else
		flash[:alert] = "Não foi possivel deletar registro."
	  end
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

  def set_ownership
		@ownership = Ownership.find(params[:id])
	end

	def get_name_params
	
	end
end