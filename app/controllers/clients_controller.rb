class ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json:{clients: @clients}
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json:{client: @client}, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    render json: {message: "client delete with sucess!"}, status: :sucess
  end

  def show
    @client = client.find(params[:id])
  end

  def update
    if @client.update_attributes(client_params)
      render json:{client: @client}, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end
  
  private

  def client_params
    params.require(:client).permit(:name, :email) 
  end
end
