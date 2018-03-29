class SessionsController < ApplicationController
  def new
  end

  def create
    puts "sessions is working"
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts user.id
      puts session[:user_id]
      redirect_to '/'
    else

      redirect_to '/login'
    end
  end

  def destroy
    puts "loging out"
    session[:user_id] = nil
    redirect_to '/login'
  end
end
