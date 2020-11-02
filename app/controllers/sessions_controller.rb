class SessionsController < ApplicationController
    
    def create

          @user = User.find_by(email: session_params[:email])
        
          if @user && @user.authenticate(session_params[:password])
            login!
            render json: {
              logged_in: true,
              user: @user
            }
          else
            render json: { login_errors: ['Invalid login credentials.', 'Verify email and/or password or create an account.']}
          end

    end

    def destroy
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end

    def login!
      super 
    end

    def logged_in?
      super 
    end

    def current_user
      super
    end

    def authorized_user?
      super
    end

    def logout!
      super 
    end


end