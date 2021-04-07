class API::UsersController < API::BaseController

	before_action :authorized, only: [:auto_login]

	def login
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
			token = encode_token({ user_id: @user.id })
			render "show.json"
			#render json: {user: @user, token: token }
		else
			render json: { error: "Invalid login" }
		end
	end

	def auto_login
		render json: @user
	end

	def create
		@user = user.create(user_params)
		if @user.valid?
			token = encode_token({ user_id: @user.id })
			render json: { user: @user, token: token }
		else
			render json: { error: "Invalid input "}
		end
	end

	def index
		render json: { users: User.all }
	end

	def show
	end

	def update
	end

	def destroy
	end

	private

	def user_params
		params.permit(:username, :password)
	end

end
