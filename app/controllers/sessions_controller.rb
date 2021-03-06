class SessionsController < ApplicationController
    def new
        render new_session_path
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            flash[:error] = "Email / password is incorrect or that user does not exist."
            redirect_to new_session_path
        else
            login!(user)
            flash[:success] = "Welcome back #{user.email}"
            redirect_to user_path(user)
        end
    end

    def destroy
        logout!
        flash[:success] = "You have been logged out!"
        redirect_to new_session_url
    end



end