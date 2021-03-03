class AmostrasController < ApplicationController
	before_action :set_user
	before_action :get_ownerships, :get_properties, only: [:new, :create, :edit]

	def index
		@amostras = Amostra.where(user_id: @user.id) # Listar propriedades do current_user
	end

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
		@amostra.property_name = get_property_name(amostra_params(:property_id))
		
		# @property.ownership => Igual ao ownership assimilado no params.require( :name, :last_name)
		
		# if @amostra.save
		# 	flash[ :notice ] = "'#{@amostra}' salvo."
		# 	redirect_to amostras_path, notice: "A nova amostra foi adicionada"
		# else
		# 	flash[:alert] = "Erro, verifque os campos digitados"
		# 	render :new
		# end

		@amostra.save

		rescue => e
		  @error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to amostras_path, flash: {success: 'Amostra cadastrada com Sucesso!'}}
			end
	end

	def update
		@amostra = Amostra.find(params[:id])
		
		@amostra.update!(amostra_params)
		
		rescue => e
			@error = e.message
		ensure
		respond_to do |format|
			format.html { redirect_to amostras_path, flash: {success: 'Amostra Editada com Sucesso!'}}	
		end
	end

	def destroy
		@amostra = Amostra.find(params[:id])
		@amostra.destroy!

		# if @amostra.destroy
		# 	redirect_to amostras_path
		# 	flash[:notice] = "Amostra destruida com sucesso!"
		# else
		# 	flash[:alert] = "Erro, tente novamente"
		# end

		rescue => e
			@error = e.message
		ensure
			respond_to do |format|
				format.html { redirect_to amostras_path, flash: {success: 'Amostra excluida com Sucesso!'}}
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

end