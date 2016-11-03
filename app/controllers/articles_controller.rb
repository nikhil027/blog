class ArticlesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render action: "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comments.destroy_all
    @article.destroy
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
    
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path, notice: "Record Not Found"
 end

  def my_articles
    @my_articles = Article.where('user_id = ?',current_user.id)
  end

private

  def article_params
    params[:article].permit(:title, :body, category_ids: [])
  end

end
