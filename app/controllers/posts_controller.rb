class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  
  def index
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました。'
      redirect_to posts_path
    else
      @posts = current_user.feed_posts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      flash[:success] = '投稿は正常に更新されました。'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿は更新されませんでした。'
      render :edit
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:lesson_id, :teacher_id, :lesson_evaluation, :lesson_level, :text_necessity, :attendance, :additional_explanation)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
