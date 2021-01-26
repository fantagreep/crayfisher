class StaticPagesController < ApplicationController
  def home
    @spots = Spot.all
    gon.spots = @spots
    @user = current_user
    if user_signed_in?
      @post = current_user.posts.build
      @post.build_spot
      @comment = Comment.new
      if params[:q]
        @q = current_user.posts.ransack(params[:q])
        @posts = @q.result(distinct: true)
      else
        @posts = Post.all.includes([:comments, :spot, :user, picture_attachment: :blob, user: { image_attachment: :blob }, comments: :user])
      end
      @feed_items = @posts.paginate(page: params[:page])
    end
  end

  def about
  end

  def terms
  end

  def policy
  end
end
