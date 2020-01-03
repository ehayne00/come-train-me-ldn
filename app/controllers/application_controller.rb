class ApplicationController < ActionController::Base
    helper_method :current_user, :current_trainer, :logged_in?

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def current_trainer
        if session[:trainer_id]
           Trainer.find(session[:trainer_id])
        end
    end

    def logged_in?
        user = current_user || current_trainer
        if !user
            flash[:notice] = "Sorry, you need to be logged in to access this feature"
            redirect_to root_path
        end    
    end
end
