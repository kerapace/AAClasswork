class SubsController < ApplicationController

    before_action :require_login, except: [:show, :index]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def 

    private
    
    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
