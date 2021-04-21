class UsersController < ApplicationController

    def index
        render plain: "I'm in the index action!"
        
    end

    def create
        render json: params
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    
    end
end