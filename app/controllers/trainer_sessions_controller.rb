class TrainerSessionsController < ApplicationController

    def new
    end

    def create
        @trainer = Trainer.find_by(username: params[:trainer][:username])
          if @trainer && @trainer.authenticate(params[:trainer][:password])
            session[:trainer_id] = @trainer.id 
            redirect_to trainer_path(@trainer)
          else
            flash[:notice] = "Sorry, we can't find a user with that username and password"
            redirect_to new_trainer_session_path
          end
    end

    def destroy
        session.destroy
        redirect_to '/'  
    end
end