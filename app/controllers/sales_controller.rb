class SalesController < ApplicationController
    def index
        @sales = Sale.all
    end
    def show
        @sale = Sale.find(params[:id])
    end
    def create
        product = Product.find(params[:product_id])
        @sale = Sale.new(sale_params)
        @sale.user_id = current_user.id
        if @sale.save
            redirect_to root_path, notice:'se ha realizado la compra'
        else
            redirect_to root_path, alert:'error'
        end
    end
    private
    def sale_params
        params.permit(:product_id)
    end
end
