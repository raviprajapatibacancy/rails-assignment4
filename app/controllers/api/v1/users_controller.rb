class Api::V1::UsersController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token

    # GET /users or /users.json
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/1 or /users/1.json
    def show
        @user = User.find(params[:id])
        render json: @users
    end

    # POST /users or /users.json
    def create
        @user = User.new(user_params)

        if @user.save
            render json: @users
        else
            render error: { error: 'Error '}, status: 400 
        end
    end

    # POST /users or /users.json
    def update
        @user = User.find(params[:id])

        if @user
            @user.update(user_params)
            render json: { message: 'User successfully updated', user: @user }, status: 200
        else
            render error: { error: 'Error '}, status: 400 
        end
    end

    # POST /users or /users.json
    def destroy
        @user = User.find(params[:id])

        if @user.destroy
            render json: { message: 'User successfully deleted' }, status: 200
        else
            render error: { error: 'Error '}, status: 400 
        end
    end

    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:id,:name, :dob, :gender, :status, address_attributes: [ :address1, :address2, :district, :state, :pincode, :user_id ])
    end
end
