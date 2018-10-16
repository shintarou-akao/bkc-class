class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build
      @posts = current_user.feed_posts.order('created_at DESC').page(params[:page])
      @user = User.find(session[:user_id])
    end
  end
end
