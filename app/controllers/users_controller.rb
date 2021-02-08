class UsersController < ApplicationController
  before_action :correct_user, only: [:password_edit, :password_update]
  before_action :user_signed_in?, only: [:password_edit, :password_update]
  protect_from_forgery :except => [:password_update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes([:spot, :picture_attachment]).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.includes([post: [{user: {image_attachment: :blob}}, :spot, :picture_attachment]])
    @posts = []
    @likes.each do |like|
      @posts << like.post
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそCrayfisherへ！"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def password_edit
    @user = User.find(params[:id])
  end

  def password_update
    @user = User.find(params[:id])
    current_password = params[:user][:current_password]
    new_password = params[:user][:new_password]
    new_password_confirmation = params[:user][:new_password_confirmation]
    if @user.valid_password?(current_password) && new_password.present? && new_password == new_password_confirmation
      if @user.update(password: new_password)
        flash[:success] = "パスワードを変更しました"
        redirect_to root_path
      else
        flash.now[:danger] = '新しいパスワードが無効です'
        render 'password_edit'
      end
    elsif new_password != new_password_confirmation
      flash[:danger] = 'パスワードが一致しません'
      render 'password_edit'
    else
      flash[:danger] = '現在のパスワードが間違っています'
      render 'password_edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  # 正しいユーザーか確認する
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
