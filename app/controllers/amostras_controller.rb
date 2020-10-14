class AmostrasController
    def index
		# Listar propriedades do current_user
		@amostras = Amostra.where(user_id: @user.id)
	end
	
	def new
	  respond_to do |format|
		@amostra = Amostra.new
		format.js
	  end	
	end

	def create
		@amostra = Amostra.new(amostra_params)
		p @amostray.user_id = @user.id
		# @property.ownership => Igual ao ownership assimilado no params.require( :name, :last_name)
		if @property.save
		  flash[ :notice ] = "'#{@property.name}' salvo."
		  redirect_to properties_path, notice: "A nova propriedade foi adicionado"
		else
		  flash[:alert] = "Erro, verifque os campos digitados"
		  render :new
		end
	end
	
	def update
	  @property.update(property_params)
	end

	private
	
	def property_params
	  params.require(:property).permit( :name, :address, :city, :uf, :cep, :area )
	end

	def set_user
	  @user = current_user
	end 
	def get_name_params
	end

	def set_ownerships
	  @ownerships = Ownership.where(user: @user)
	end
end