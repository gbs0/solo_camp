class AmostrasController < ApplicationController
    before_action :set_user
	before_action :get_ownerships, :get_properties, only: [:new, :create]

    def index
		# Listar propriedades do current_user
		# @amostras = Amostra.where(user_id: @user.id)
	end
	
	def new
	  respond_to do |format|
		@amostra = Amostra.new
		format.js
	  end	
	end

	def create
		@amostra = Amostra.new(amostra_params)
		# p @amostra.user_id = @user.id
		# @property.ownership => Igual ao ownership assimilado no params.require( :name, :last_name)
		if @amostra.save
		  flash[ :notice ] = "'#{@amostra}' salvo."
		  redirect_to properties_path, notice: "A nova amostra foi adicionada"
		else
		  binding.pry
		  flash[:alert] = "Erro, verifque os campos digitados"
		  render :new
		end
	end
	
	def update
	  @amostra.update(amostra_params)
	end

	private
	
	def amostra_params
	  params.require(:amostra).permit( 
		  :owner_name, :profundidade, :compactacao, :property_name, :peso, :argila, :potassio, :calcario, :magnesio, :enxofre20,
          :enxofre40, :hidrogenio, :alcalinidade, :boro, :cobre, :manganes,
          :zinco, :carbono, :materia, :valor, :ctc
        )
	end

	def set_user
	  @user = current_user
    end 
    
	def get_name_params
	end
	
	def get_ownerships
	  @ownerships = Ownership.where(user_id: @user.id)
	end

	def get_properties
	  @properties = Property.where(user_id: @user.id)
	end

end