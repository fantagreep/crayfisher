class CommentsController < ApplicationController
  before_action :user_signed_in?

  def create
     @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "コメントが削除されました!"
    redirect_to request.referrer || root_url
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
