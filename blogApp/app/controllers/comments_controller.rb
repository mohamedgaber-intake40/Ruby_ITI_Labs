class CommentsController < ApplicationController
    load_and_authorize_resource
    # before_action :authenticate_user!, only: :destroy
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
             redirect_to article_path(@article)
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    private
    def comment_params
        params.require(:comment).permit( :body)
    end
end
