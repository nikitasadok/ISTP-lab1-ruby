class SongsController < ApplicationController
	def index 
		if params[:performer_id]
			@songs = Song.where(:performer_id => params[:performer_id])
		else
		  @songs = Song.all
		end
	end

	def show
    	@song = Song.find(params[:id])
	end

	def new 
		@song = Song.new
	end

	def edit 
		@song = Song.find(params[:id])
	end 

	def create
		@song = Song.new(song_params)

		if @song.save
			redirect_to @song
		else
			render 'new'
		end
	end

	def update 
		@song = Song.find(params[:id])

		if @song.update(song_params)
			redirect_to @song
		else
			render 'edit'
		end
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy

		redirect_to songs_path
	end

	private
	 def song_params
		params.require(:song).permit(:name, :performer_id)
	 end
end
