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
    @user = User.find_by(id: session[:user_id])

    @article = @user.articles.new(
      title: params[:title],
      content: params[:content],
    )
    if params[:image]
      @article.image = params[:image]
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
    @user = @article.user
    @comments   = @article.comments
  end

  def edit
    if params[:article_id]
      @article = Article.find_by(id: params[:article_id])
    else
      @comment = Comment.find_by(id: params[:comment_id])
    end
  end

  def modify
    @article = Article.find_by(id: params[:article_id])
    @article.title = params[:title]
    @article.content = params[:content]
    if params[:image]
      @article.image = params[:image]
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
    @user = User.find_by(id: session[:user_id])
    @comment = @article.comments.new(
      user_id: @user.id,
      comment: params[:comment]
    )   
    if @comment.save
      @comments = @article.comments
      redirect_to("/article/#{@article.id}")
    else
      @comments = @article.comments
      render("article/content")
    end
  end

  def comment_modify
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.comment = params[:comment]

    if @comment.save
      flash[:notice] = "コメントを修正しました"
      redirect_to("/article/#{@comment.article_id}")
    else
      render("article/edit")
    end
  end

  def comment_destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @article = @comment.article
    @comment.destroy
    redirect_to("/article/#{@article.id}")
  end

  def user_check
    if params[:article_id]
      @check = Article.find_by(id: params[:article_id])
    else
      @check = Comment.find_by(id: params[:comment_id])
    end
    if session[:user_id] != @check.user_id
      flash[:notice] = "該当記事の編集権限がありません"
      redirect_to("/article/#{@article.id}")
    end
  end
end
