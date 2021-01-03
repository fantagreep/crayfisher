class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @post.picture.attach(params[:post][:picture])
    if @post.save
      flash[:success] = "投稿されました！"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      flash[:danger] = @post.errors.full_messages
      redirect_to root_url
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました!"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :picture)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
