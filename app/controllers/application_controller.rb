class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?


    def login!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end

    def logout!
        current_user.try(:reset_session_token)
        session[:session_token] = nil
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end


    private

        def authenticate_user!
            redirect_to :root unless !current_user.nil?
        end

end
