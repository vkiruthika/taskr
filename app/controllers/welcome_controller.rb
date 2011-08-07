class WelcomeController < ApplicationController
  def index
    redirect_to buckets_path if current_user
  end  
end
