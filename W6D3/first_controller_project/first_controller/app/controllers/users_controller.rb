class UsersController < ApplicationController

    def index
        render plain: "I'm in the index action!"
        
    end

    def create
       user = User.new(params.require(:user).permit(:username,:email)) 
       if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create
        user = User.new(params.require(:user).permit(:username,:email))
        user.save!
        render json: user
    end
end