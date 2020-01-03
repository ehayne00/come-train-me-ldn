class BookingsController < ApplicationController

 before_action :logged_in?
 before_action :find_booking, only: [:show, :edit, :update]
    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.create(booking_params)
        @booking.user = current_user
        @booking.save
        if @booking.valid?
        redirect_to booking_path(@booking.id)
        else
            render :new
        end
    end

    def show
        find_booking
    end

    def edit
        find_booking
    end

    def update
        find_booking
        @booking.update(booking_params)
        redirect_to booking_path(@booking)
    end

    def destroy
        Booking.destroy(params[:id])
        if current_user
        redirect_to user_path(current_user)
        elsif current_trainer
            redirect_to trainer_path(current_trainer)
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:date, :time, :user_id, :trainer_id)
    end

    def find_booking
        @booking = Booking.find(params[:id])
    end
end
