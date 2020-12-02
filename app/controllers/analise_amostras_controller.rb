class AnaliseAmostrasController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @amostras = Amostra.where(user_id: :set_user.id)
    @analise_amostra = AnaliseAmostra.new
  end

  def create
    @amostras = Amostra.where(params[:amostra_id])
    @amostras.each do |amostra|
      analise_amostra = AnaliseAmostra.new
      analise_amostra.user = :set_user
      analise_amostra.analise = analise_amostra_params([:analise_id])
      analise_amostra.amostra = amostra
      analise_amostra.save
    end
  end

  private

  def analise_amostra_params
    params.require(:analise_amostra).permit(:amostras_id, :analise_id)
  end

  def set_user
    @user = current_user
  end
end
