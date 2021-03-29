class API::PostsController < ApplicationController

	def index
		render json: { posts: Post.all }
	end

	def show
	end

	def create

	end

	def update
	end

	def destroy
	end

end
