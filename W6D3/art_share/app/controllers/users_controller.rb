class UsersController < ApplicationController

    def index
        user = User.all
        render json: user
        # render plain: "I'm in the index action!"

        
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

   def update
         user =  User.find_by(id: params[:id])

        if user.update(params.require(:user).permit(:username,:email))
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
   end

   def destroy
        user =  User.find_by(id: params[:id])
        if user.destroy
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
   end

end