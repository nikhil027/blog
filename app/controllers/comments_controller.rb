class CommentsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
     @comment = Comment.new(comment_params) 
     @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@comment.article_id)
    else
      redirect_to article_path(@comment.article_id)
      #render action: "new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to article_path(@comment.article_id)
    else
      render action: "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article_id)
  end

  def show
  end


private
  def comment_params
    params[:comment].permit(:comment_body, :article_id)
  end


end



