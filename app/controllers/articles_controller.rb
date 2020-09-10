class ArticlesController < ApplicationController
  include Pagy::Backend
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @pagy, @articles = pagy(Article.published.where("lower(title) LIKE lower(?)", "%#{params[:query]}%").order(date: :desc), items: 5)
    else
      @pagy, @articles = pagy(policy_scope(Article.published.order(date: :desc)), items: 5)
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.punch(request)
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :date, :is_published)
  end
end
