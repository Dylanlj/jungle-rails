class UsersController < ApplicationController




  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      puts "these are the error messages #{@user.errors.messages}"
      @user.errors.messages.each do |newError|
        puts newError
      end
      render :new
    end

  end

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation)
    end

end
