class LikesController < ApplicationController
  protect_from_forgery
  before_action :user_signed_in?

  def create
    @post = Post.find(params[:post_id])
    unless @post.favorite?(current_user)
      Like.create(user_id: current_user.id, post_id: @post.id)
    end
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.favorite?(current_user)
      @post.unfavorite(current_user)
      @post.reload
    end
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
end
