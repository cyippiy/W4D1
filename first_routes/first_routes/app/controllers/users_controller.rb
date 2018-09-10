class UsersController < ApplicationController
  def index
    render plain: "I'm in the index action!"
  end
  
  def create
    # debugger
    user = User.new(params.require(:user).permit(:name,:email))
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
    
  end 
  
  def show 
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end
  
  def update
    user = User.find(params[:id])
    if user.update(params.require(:user).permit(:name,:email))
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end
  
  def destroy
    user = User.find(params[:id])
    if user.destroy()
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end 
  end
end