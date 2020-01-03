class TrainersController < ApplicationController

    def new
        @trainer = Trainer.new
    end

    def create
        
        @trainer = Trainer.create(trainer_params)
        params[:trainer][:specialty_ids].each do |specialty_id|
            TrainerSpecialty.create(specialty_id: specialty_id, trainer_id: @trainer.id)
        end

        if @trainer.valid?
         session[:trainer_id] = @trainer.id
         redirect_to trainer_path(@trainer)
        else
            render :new
        end
        
        
    end

    def show
        @trainer = Trainer.find(params[:id])
    end

    def edit
        @trainer = Trainer.find(params[:id])
    end

    def update
        @trainer = Trainer.find(params[:id])
        
        @trainer.update(trainer_params)
        redirect_to trainer_path(@trainer)
    end

    def destroy
        Trainer.destroy(params[:id])
        session.destroy
        redirect_to '/'
    end

    private

    def trainer_params
        params.require(:trainer).permit(:price, :username, :password, :name, :email, :image, :specialty_ids, :bio, :gender, :area_id)
    end
end
