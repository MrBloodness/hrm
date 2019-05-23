class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          if current_user
            redirect_to users_url, notice: 'User was successfully created.'
          else
            redirect_to new_user_session_path
          end
        end
      else
        @user.valid?
        format.html { render 'devise/registrations/new' }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.skip_password_validation = true
    @user.save
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
