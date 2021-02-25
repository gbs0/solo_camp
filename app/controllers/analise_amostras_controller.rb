class AnaliseAmostrasController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update]

  def index; end

  def edit; end
  
  def new
    @amostras = Amostra.where(user_id: :set_user.id)
    # pegar as amostras daquele user com a propriedade vinda do backend
    @analise_amostra = AnaliseAmostra.new
  end

  # def create # Criar uma análise utilizando Background Job
  #   @amostras = Amostra.where(params[:amostra_id])
  #   @amostras.each do |amostra|
  #     analise_amostra = AnaliseAmostra.new
  #     analise_amostra.user = :set_user
  #     analise_amostra.analise = analise_amostra_params([:analise_id])
  #     analise_amostra.amostra = amostra
  #     analise_amostra.save
  #   end
  # end

  def update
    @analise_amostra = AnaliseAmostra.find(params[:id])

    rescue => e
      @error = e.message
    ensure
      respond_to do |format|
        format.html { redirect_to analise_amostras_path, flash: {sucess: "Analise de Solo Editada com sucesso!"}}
      end
  end

  def destroy
    @analise_amostra = AnaliseAmostra.find(params[:id])

  end
  private

  def analise_amostra_params
    params.require(:analise_amostra).permit(:amostras_id, :analise_id)
  end

  def set_user
    @user = current_user
  end
end
