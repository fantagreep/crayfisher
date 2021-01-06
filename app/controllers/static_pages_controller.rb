class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @post.build_spot
      @posts = Post.all.includes([:spot, :user, :picture_attachment])
      @feed_items = @posts.paginate(page: params[:page])
      gon.posts = @post
      @spots = Spot.all
      gon.spots = @spots
    end
    @user = current_user
  end

  def about
  end

  def terms
  end

  def policy
  end
end
