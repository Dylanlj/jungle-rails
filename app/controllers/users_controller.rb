class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to :root, notice: 'Usesr registered!'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end


  def destroy
  end

  def user_params
    puts params
    puts :user
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
      )
  end

end
