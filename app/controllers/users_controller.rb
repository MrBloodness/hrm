class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def create_user
  #   @user = User.new(email: params[:email], password: params[:password])
  #   @user.save
  # end

  # def new
  #   @user = User.new
  # end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        @user.valid?
        format.html { render 'devise/registrations/new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
