class UserSessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
          if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
          else
            flash[:notice] = "Sorry, we can't find a user with that username and password"
            redirect_to new_user_session_path
          end
    end

    def destroy
        session.destroy
        redirect_to '/' 
    end
end
