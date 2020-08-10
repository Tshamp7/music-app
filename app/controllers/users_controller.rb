class UsersController < ApplicationController

    def new
        @user = User.new
        render new_user_path
    end


    def create
        @user = User.new(user_params)

        if @user.save
            render user_path
        else
            flash[:error] = @user.errors.full_messages.to_sentence
            render new_user_path
        end
        
    end

    private

        def user_params
            params.require(user).permit(:email, :password)
        end


end