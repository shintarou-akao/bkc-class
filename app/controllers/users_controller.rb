class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :destroy, :followings, :followers, :favorites]
  
  def index
    @users = User.all.page(params[:page])
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
    else
      redirect_to root_url
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_path
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def favorites
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page])
    counts(@user)
  end
  
  def subject_select
    @subjects = params[:user_department_id] ? Subject.where(department_id: params[:user_department_id]) : []
  end
  
  private
  
  def user_params
    params.require(:user).permit(:grade_id, :department_id, :subject_id, :nickname, :email, :password, :password_confirmation)
  end
end
