class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to sub_post_url(@post.sub_id,@post.id)
        else
            flash[:errors]
            redirect_to sub_url(@post.sub_id)
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if current_user == @post.author || current_user = @post.sub.moderator
            @post.destroy
        else
            flash[:errors] = ["You do not have permission to perform this action."]
        end
        redirect_to sub_url(@post.sub)
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && @post.update(post_params)
            redirect_to sub_url(@post.sub)
        else            
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end