class WelcomeController < ApplicationController
  def index
    if params[:festival_days_to_festivals]
      @graph = FestivalDay.festivals_ratio
    if params[:festivals_to_organizers]
      @graph = Festival.organizers_ratio
    end
  end
end
end

