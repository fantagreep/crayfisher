class StaticPagesController < ApplicationController
  def home
    @posts = Post.all.includes([:comments, :spot, :user, picture_attachment: :blob, user: { image_attachment: :blob }, comments: :user])
    @feed_items = @posts.paginate(page: params[:page])
    @spots = Spot.all
    gon.spots = @spots
    @user = current_user
    if user_signed_in?
      @post = current_user.posts.build
      @post.build_spot
      @comment = Comment.new
    end
  end

  def about
  end

  def terms
  end

  def policy
  end
end
