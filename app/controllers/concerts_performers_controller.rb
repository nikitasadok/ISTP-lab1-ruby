class ConcertsPerformersController < ApplicationController
    def index 
		@concerts_performers = ConcertsPerformer.all
	end

	def show
    	@concerts_performer = ConcertsPerformer.find(params[:id])
	end

	def new 
		@concerts_performer = ConcertsPerformer.new
	end

	def edit 
		@concerts_performer = ConcertsPerformer.find(params[:id])
	end 

	def create
		@concerts_performer = ConcertsPerformer.new(concerts_performer_params)

		if @concerts_performer.save
			redirect_to @concerts_performer
		else
			render 'new'
		end
	end

	def update 
		@concerts_performer = ConcertsPerformer.find(params[:id])

		if @concerts_performer.update(concerts_performer_params)
			redirect_to @concerts_performer
		else
			render 'edit'
		end
	end

	def destroy
		@concerts_performer = ConcertsPerformer.find(params[:id])
		@concerts_performer.destroy

		redirect_to concerts_performers_path
	end

	private
	 def concerts_performer_params
		params.require(:concerts_performer).permit(:performer_id, :concert_id)
	 end
end
