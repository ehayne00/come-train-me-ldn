class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        User.destroy(params[:id])
        session.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :age, :gender, :email, :area_id)
    end
end
