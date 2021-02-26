class AnaliseAmostrasController < ApplicationController
  before_action :set_user, :get_properties, :get_amostras only: [:new, :create, :edit, :update]
  

  def index; end

  def edit; end

  def new
    @amostras = Amostra.where(user_id: :set_user.id)
    # pegar as amostras daquele user com a propriedade vinda do backend
    @analise_amostra = AnaliseAmostra.new
  end

  def create # Criar uma análise utilizando Background Job
    @analise_amostra
    @amostras.each do |amostra|
      @analise_amostra.user = set_user.id
      @analise_amostra.analise = @analise_amostra_params([:analise_id])
      @analise_amostra.amostra = amostra
      @analise_amostra.save
    end
  end

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
    @analise_amostra.destroy!

    rescue => e
      e.message
    ensure
      respond_to do |format|
        format.html { redirect_to analise_amostras_path, flash: {sucess: "Analise de Solo excluida com sucesso!"}}
      end 
  end

  private

  def analise_amostra_params
    params.require(:analise_amostra).permit(:amostras_id, :analise_id)
  end

  def set_user
    @user = current_user
  end

  def get_properties
    @properties = Properties.where(user_id: set_user.id)
  end

  def get_amostras
    @amostras = Amostra.where(user_id: set_user.id)
  end
end
