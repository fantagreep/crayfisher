class Api::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render json: @post.as_json
  end
end