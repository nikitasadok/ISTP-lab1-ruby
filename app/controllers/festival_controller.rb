class FestivalController < ApplicationController
	def show
	@data = Festival.where("organizer_id = '1'")
	end
end
