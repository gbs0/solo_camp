class DashboardController < ApplicationController
    def index
        @insumo = Insumo.all
    end
end
