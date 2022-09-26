class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json:{categories: @categories}
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json:{category: @category}, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    render json: {message: "category delete with sucess!"}, status: :sucess
  end

  def show
    @category = category.find(params[:id])
  end

  def update
    if @category.update_attributes(category_params)
      render json:{category: @category}, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:name, :seller_id) 
  end
end
