class UsersController < ApplicationController
  
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
            sign_in(@user)
            redirect_to home_path
          end
        end
      else
        @user.valid?
        format.html { render 'devise/registrations/new' }
      end
    end
  end

  # removed for more security reason

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

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
