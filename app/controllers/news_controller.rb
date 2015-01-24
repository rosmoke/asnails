class NewsController < ApplicationController  
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @news = News.all
    respond_with(@news)

  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    
  end
  def vote_for
    @article = News.find(params[:id])
    current_user.vote_for(@article)
    respond_to do |format|
      format.js
    end
end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.save
    respond_with(@admin, :location => admin_news_path)
  end

  def update
    @news.update(news_params)
    respond_with(@admin, :location => admin_news_path)
  end

  def destroy
    @news.destroy
    redirect_to :back
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :content, :img_url, :votes, :image)
    end
end
