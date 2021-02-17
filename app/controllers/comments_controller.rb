class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    authorize @comment
  end
end
