class NewsArticlesController < ApplicationController
    before_action :find_news_article, only: [:show, :edit, :update, :destroy]

    def new
        @news_article = NewsArticle.new
    end
    def create
        @news_article = NewsArticle.new news_article_params
        if @news_article.save
          redirect_to news_article_path(@news_article)
        else
          render :new
        end
    end

    def show

    end

    def destroy
      @news_article.destroy
      flash[:danger] = "News Article destroyed!"
      redirect_to news_articles_path
    end

    def index
      @news_articles = NewsArticle.order(created_at: :desc)
    end

    def edit

    end
    def update
      if @news_article.update news_article_params
        redirect_to news_article_path(@news_article.id)
      else
          render :edit
      end
    end



    private

    def news_article_params
      params.require(:news_article).permit(:title, :description, :published_at, :view_count)
    end

    def find_news_article
      @news_article = NewsArticle.find(params[:id])
    end
end
