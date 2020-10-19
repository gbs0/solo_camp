class AmostrasController < ApplicationController
    before_action :set_user, :get_ownerships

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
          :peso, :argila, :potassio, :calcario, :magnesio, :enxofre20,
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
	  @ownerships = Ownership.all(user_id: user.id)
	end

end