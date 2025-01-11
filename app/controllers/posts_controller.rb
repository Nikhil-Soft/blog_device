class PostsController < ApplicationController

	def index
		@posts = Post.all
	end 

	def create
    user = User.find(params[:user_id])
    post = user.posts.create!(post_params)
    render json: post, status: :created
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
