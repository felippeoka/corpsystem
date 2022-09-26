class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json:{products: @products}
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json:{product: @product}, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: {message: "Product delete with sucess!"}, status: :sucess
  end

  def show
    @product = Product.find( params[:id] )
  end

  def update
    if @product.update_attributes( product_params )
      render json:{product: @product}, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :seller_id) 
  end
end
