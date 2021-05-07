class PostsController < ApplicationController

    def new
        @post = Post.new
        @sub = Sub.find_by(id: params[:sub_id])
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save
            redirect_to sub_post_url(@post.sub_id,@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to sub_url(@post.sub_id)
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if current_user.id == @post.author_id || current_user.id = @post.sub.moderator_id
            @post.destroy
        else
            flash[:errors] = ["You do not have permission to perform this action."]
        end
        redirect_to sub_url(@post.sub)
    end

    def edit
        @post = Post.find_by(id: params[:id])
        if @post && current_user == @post.author
            render :edit
        else
            flash[:errors] = ["You do not have permission to perform this action."]
            redirect_to sub_post_url(@post.sub, @post)
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && current_user == @post.author
            if  @post.update(post_params)
                redirect_to sub_url(@post.sub)
            else            
                flash[:errors] = @post.errors.full_messages
                render :edit
            end
        else
            flash[:errors] = ["You do not have permission to perform this action."]
            redirect_to sub_post_url(@post.sub, @post)
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    private
    def post_params
        params.require(:post).permit(:title,:content, :sub_ids)
    end
end
