class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy, :edit, :update]

  def show
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿が更新されました"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :picture, spot_attributes: [:address, :latitude, :longitude])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
