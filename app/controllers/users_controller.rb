class UsersController < ApplicationController

    def new
        @user = User.new
        render new_user_path
    end


    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages.to_sentence
            render new_user_path
        end
        
    end

    def index
    end

    def show
        @user = current_user
    end

    private

        def user_params
            params.require(:user).permit(:email, :password)
        end
        
end