class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy, :show]

  def create
    @comments = Comment.all
    @comment = @article.comments.create(comment_params)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end