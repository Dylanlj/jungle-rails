class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_AUTHENTICATION_NAME'], password: ENV['HTTP_AUTHENTICATION_PASSWORD'], except: :index

  def show
  end
end
