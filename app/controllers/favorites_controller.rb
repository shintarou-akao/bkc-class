class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unfavorite(@post)
    flash[:danger] = 'お気に入りから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
