class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all.order(created_at: :asc)
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

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

  def edit
  end

  def update
      redirect_to articles_index_url, notice: "Article was successfully updated." if @article.update(article_params)
  end

  def destroy
    @article_id =@article.id
    @article.destroy
  end

  private

  def set_article
    @article = Article.find params[:id]
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
