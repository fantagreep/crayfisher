class Api::V1::PostsController < ApiController
    rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: '404 not found' }, status: 404
    end
  
    def index
      posts = Post.all
      render json: posts
    end
  end