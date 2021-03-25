class AmostrasController < ApplicationController
	before_action :set_user
	before_action :set_user_samples, only: [:index]
	before_action :get_ownerships, :get_properties, only: [:new, :create, :edit]

	def index; end

	def new
		respond_to do |format|
			@amostra = Amostra.new
			format.js
		end
	end

	def show
		@amostra = Amostra.find(params[:id])
	end

	def edit
		@amostra = Amostra.find(params[:id])
	end

	def create
		@amostra = Amostra.new(amostra_params)
		@amostra.user_id = @user.id 
		property_id = @amostra.property_id
		@amostra.property_name = get_property_name(property_id)
		
		if @amostra.save
			redirect_to amostras_path, flash: {success: 'Amostra cadastrada com Sucesso!'}
		else
			flash[:alert] = "Erro, verifque os campos digitados"
			render :new
		end
	end

	def update
		@amostra = Amostra.find(params[:id])
		
		if @amostra.update!(amostra_params)
			redirect_to amostras_path, flash: {success: 'Amostra editada com Sucesso!'}
		else
			flash[:alert] = "Erro, verifque os valores digitados"
			render :new
		end
	end

	def destroy
		@amostra = Amostra.find(params[:id])
		

		if @amostra.destroy
			redirect_to amostras_path, flash: {success: 'Amostra excluida com Sucesso!'}
		else
			flash[:alert] = "Erro, tente novamente"
		end
	end

	private

	def amostra_params
		params.require(:amostra).permit(
				:property_id, :profundidade, :compactacao, :peso, :argila, :potassio, :calcario, :magnesio, :enxofre20,
				:enxofre40, :hidrogenio, :alcalinidade, :boro, :cobre, :manganes,
				:zinco, :carbono, :materia, :valor, :ctc
		)
	end

	def set_user
		@user = current_user
	end

	def get_name_params; end

	def get_ownerships
		@ownerships = Ownership.where(user_id: @user.id)
	end

	def get_properties
		@properties = Property.where(user_id: @user.id)
	end

	def get_property_name(id)
	  Property.find(id).name
	end

	def set_user_samples
		@amostras = Amostra.by_user(@user.id) 
	end

end