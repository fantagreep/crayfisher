class StaticPagesController < ApplicationController
  def home
    @spots = Spot.all
    gon.spots = @spots
    @user = current_user
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = Post.all.includes([:comments, :spot, :user, picture_attachment: :blob, user: { image_attachment: :blob }, comments: :user]).
        ransack(params[:q])
      @posts = @q.result(distinct: true).paginate(page: params[:page])
    else
      @q = Post.none.ransack
      @posts = Post.all.includes([:comments, :spot, :user, picture_attachment: :blob, user: { image_attachment: :blob }, comments: :user])
    end
    @feed_items = @posts.paginate(page: params[:page])
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
