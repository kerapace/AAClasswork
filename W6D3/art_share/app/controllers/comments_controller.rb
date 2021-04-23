class CommentsController < ApplicationController
    def create
        comment = Comment.new(params.require(:comment).permit(:body,:artwork_id,:user_id))
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def index
        if !params[:user_id].nil?
            comments = Comment.where(user_id: params[:user_id])
            render json: comments
        elsif !params[:artwork_id].nil?
            comments = Comment.where(artwork_id: params[:artwork_id])
            render json: comments
        else
            render json: Comment.all
        end
    end
end