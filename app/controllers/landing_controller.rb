class LandingController < ApplicationController

  def show
    redirect_to home_index_path if current_user    
  end

end