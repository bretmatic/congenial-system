class API::PostsController < ApplicationController

	def index
		if(params[:user_id])
			@posts = Post.where('user_id = ?', logged_in_user.id)
		else
			@posts = Post.all
		end
		render json: { posts: @posts, current_user: logged_in_user }
	end

	def show
		@post = Post.find(params[:id])
		render json: { posts: @post }
	end

	def create
		@post = Post.create(user: logged_in_user, message: params[:message])
		if(params.has_key?(:response_to))
			@post.parent_id = params[:response_to]
		end
		@post.save!
		render json: @post
	end

	def update
	end

	def destroy
	end

end
