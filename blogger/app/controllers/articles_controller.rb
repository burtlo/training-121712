class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
    @comment = Comment.new
    @comment.article_id = @article.id
    
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])

    @article.update_attributes article_params
    @article.save

    flash[:notice] = "Succesfully UPDATED article!"

    redirect_to article_path(@article)
  end
  

  def destroy
    Article.delete(params[:id])
    flash[:notice] = "Succesfully DELETED article!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  
  private
  
  def article_params
    params[:article].permit(:title, :body)
  end

end