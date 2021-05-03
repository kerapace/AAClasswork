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

    def destroy
        @sub = Sub.find_by(id: params[:id])
        if @sub && current_user.id == @sub.moderator_id
            @sub.destroy
            redirect_to "/"
        else
            flash[:errors] = ["You do not have permission to perform this action."]
            redirect_to sub_url(@sub)
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id]).includes(:posts).includes(:author).order('created_at DESC')
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
