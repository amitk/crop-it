class DashboardController < ApplicationController
  
  def index
    render plain: "hello"
  end

  def ping
    render plain: 'pong'
  end
end
