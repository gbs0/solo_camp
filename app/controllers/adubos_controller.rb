class AdubosController < ApplicationController
    def index
      @adubos = Adubo.all
    end

    def new
      @adubo = Adubo.new
    end
  
    def create
      @user = current_user
      @adubo = Adubo.new(adubo_params)
      # @product.user_id = current_user.id

      # unless asset_exist?(@product.image)
      #   @product.image = 'https://picsum.photos/200/300'
      # end

      if @adubo.save
        redirect_to insumos_path, notice: "Seu adubo foi adicionado"
      else
      flash[:alert] = "Error"
      render :new
    end


  


  # def show
  #   @product = Product.find(params[:id])
  # end

  # def buy
  #   redirect_to product_path(params[:product_id]), notice: "Parabéns, sua compra foi confirmada!"
  # end

  # Rotas destroy, edit & update ñ serão utilizadas na apresentação
  # def edit
  # end

  # def destroy
  # end

  # def update
  # end

  private
  # def set_user
  #   @user = current_user
  # end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

  def adubo_params
    params.require(:adubo).permit( :comercial_name, :n, :p, :k, :preco_saca )
    # params.require(:adubo).permit( :comercial_name, :n, :p, :k, :preco_saca, :category, :description )
  end

#   def asset_exist?(path)
#     if Rails.configuration.assets.compile
#       Rails.application.precompiled_assets.include? path
#     else
#       Rails.application.assets_manifest.assets[path].present?
#     end
  end
end
