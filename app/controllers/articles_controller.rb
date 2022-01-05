class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new params.require(:article).permit(:title, :body)

    respond_to do |format|
      if @article.save
        @articles = Article.all
        format.html { render :index, notice: "Article was successfully created." }
        # format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @article = Article.new
  end

end
