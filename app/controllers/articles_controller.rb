class ArticlesController < ApplicationController
  def index
   @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # this new article is a placeholder and will never be saved to the db;
    # it is here b/c sometimes @article will be populated
    # with data that producdd an error
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end 
  end


  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
