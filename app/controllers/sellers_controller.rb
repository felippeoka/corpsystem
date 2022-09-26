class SellersController < ApplicationController
  def index
    @sellers = Seller.all
    render json:{ sellers: @sellers }
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      render json:{seller: @seller}, status: :created
    else
      render json: @seller.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @seller.destroy
    render json: { message: "Seller delete with sucess!" }, status: :sucess
  end

  def show
    @seller = seller.find( params[:id] )
  end

  def update
    if @seller.update_attributes(seller_params)
      render json:{seller: @seller}, status: :ok
    else
      render json: @seller.errors, status: :unprocessable_entity
    end
  end
  
  private

  def seller_params
    params.require(:seller).permit(:name, :email) 
  end
end
