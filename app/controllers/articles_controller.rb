class ArticlesController < ApplicationController
  include Pagy::Backend
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @pagy, @articles = pagy(policy_scope(Article.published.where("lower(title) LIKE lower(?)", "%#{params[:query]}%").order(date: :desc)), items: 6)
    else
      @pagy, @articles = pagy(policy_scope(Article.published.order(date: :desc)), items: 6)
    end
  end

  def show
    @article.punch(request)
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
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  def article_params
    params.require(:article).permit(:title, :content, :date, :is_published)
  end
end
