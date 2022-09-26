class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json:{orders: @orders}
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json:{order: @order}, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    render json: {message: "Order delete with sucess!"}, status: :sucess
  end

  def show
    @order = order.find(params[:id])
  end

  def update
    if @order.update_attributes(order_params)
      render json:{order: @order}, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
  private

  def order_params
    params.require(:order).permit(array [:product_id], :client_id) 
  end
end
