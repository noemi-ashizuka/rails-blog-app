class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
