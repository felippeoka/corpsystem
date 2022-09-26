class ListsController < ApplicationController
  def index
    @lists = List.all
    render json:{lists: @lists}
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json:{list: @list}, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    render json: {message: "List delete with sucess!"}, status: :sucess
  end

  def show
    @list = list.find(params[:id])
  end

  def update
    if @list.update_attributes(list_params)
      render json:{list: @list}, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end
  
  private

  def list_params
    params.require(:list).permit(:client_id) 
  end
end
