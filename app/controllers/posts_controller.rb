class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show, :search, :category, :rank]

  def index
    @posts = Post.includes(:user).order("id DESC")
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '投稿を削除しました'
    else
      render :show, notice: '投稿を削除できませんでした'
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def search
    @posts = Post.search(params[:keyword]).order("id DESC")
  end

  def category
  end

  def rank
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
