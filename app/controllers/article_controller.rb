class ArticleController < ApplicationController
  before_action :authenticate_user
  before_action :user_check, {only:[:edit]}
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
    @comment = Comment.new
  end

  def create
    @article = Article.new(
      user_id: @current_user.id,
      title: params[:title],
      content: params[:content],
    )
    
    if params[:image]
      @article.image_name = params[:image].original_filename
      image = params[:image]
      File.binwrite("public/article_images/#{@article.image_name}", image.read)
    end

    if @article.save
      flash[:notice] = "記事を投稿しました"
      redirect_to("/article/index")
    else
      render("article/new")
    end
  end

  def content
    @article = Article.find_by(id: params[:article_id])
    @user = User.find_by(id: @article.user_id)
    @comments = Comment.where(article_id: @article.id)
  end

  def edit
    @article = Article.find_by(id: params[:article_id])
  end

  def modify
    @article = Article.find_by(id: params[:article_id])
    @article.title = params[:title]
    @article.content = params[:content]
    if params[:image_name] && @article.image_name != params[:image_name]
      @article.image_name = params[:image].original_filename
      image = params[:image]
      File.binwrite("public/article_images/#{@article.image_name}", image.read)
    end

    if @article.save
      flash[:notice] = "記事を修正しました"
      redirect_to("/article/index")
    else
      render("article/edit")
    end
  end

  def comment
    @article = Article.find_by(id: params[:article_id])
    @user = User.find_by(id: @article.user_id)
    @comment = Comment.new(
      user_id: @current_user.id,
      user_name: @current_user.name,
      article_id: params[:article_id],
      comment: params[:comment]
    )   
    if @comment.save
      @comments = Comment.where(article_id: @article.id)
      redirect_to("/article/#{@article.id}")
    else
      @comments = Comment.where(article_id: @article.id)
      render("article/content")
    end
  end

  def user_check
    @article = Article.find_by(id: params[:article_id])
    if @current_user.id != @article.user_id
      flash[:notice] = "該当記事の編集権限がありません"
      redirect_to("/article/#{@article.id}")
    end
  end
end
