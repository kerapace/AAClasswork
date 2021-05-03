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
    end

    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
