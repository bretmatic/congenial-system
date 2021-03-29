class API::PostsController < ApplicationController

	def index
		if(params.has_key?(:user_id))
			@posts = Post.where('user_id = ?', logged_in_user.id)
		elsif(params.has_key?(:start_date) && params.has_key?(:end_date))
			@posts = Post.where('created_at > ? AND created_at < ?', Time.parse(params[:start_date]), Time.parse(params[:end_date]))
		else
			@posts = Post.all
		end

		render json: { posts: @posts, current_user: logged_in_user }
	end

	def show
		@post = Post.find(params[:id])
		render json: { posts: @post }
	end

	def expanded
		@post = Post.find(params[:post_id])
		@responses = Post.where('parent_id = ?', @post.id)
		render json: { posts: @post, responses: @responses }
	end

	def create
		@post = Post.create(user: logged_in_user, message: params[:message])
		if(params.has_key?(:response_to))
			@post.parent_id = params[:response_to]
		end
		if(params.has_key?(:private))
			@post.private = true
		end
		@post.save!
		render json: @post
	end

	def update
	end

	def destroy
	end

end
