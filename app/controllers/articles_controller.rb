class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]

    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
  		@article = Article.find(params[:id])
  		@article.destroy

  		flash.notice = "Article '#{@article.title}' was Deleted!"

  		redirect_to articles_path
  	end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
