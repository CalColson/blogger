class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.create(article_params)

		flash.notice = "Article '#{@article.title}' was created!"
		redirect_to @article
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' was updated!"
		redirect_to @article
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article '#{@article.title}' was deleted!"
		redirect_to articles_path
	end

end
