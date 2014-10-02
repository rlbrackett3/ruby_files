class PostsController < ApplicationController

		def index
			@posts = Post.where(user_id: User.find(params[:user_id]))
			@user = User.find()
		end
		
		def show
			@post = Post.find(params[:id])
		end

		def new	
			@posts = Post.new
		end

		def create
			@post = Post.new(params[:post])
			if @post.save
				flash[:notice] = "Post was added"
				redirect_to user_posts_path
			else
				flash[:alert] = "We're sorry but we couldn't add your post"
				redirect_to user_posts_path
			end
		end

		def edit
			@posts = Post.find(params[:id])
		end

		def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Your post has been modified"
		else
			flash[:alert] = "Something went wrong. Try again later"
		end
		redirect_to user_posts_path
		end


		private
	def post_params
		params.require(:post).permit(:title,:body)
	end
end