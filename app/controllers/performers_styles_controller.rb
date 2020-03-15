class PerformersStylesController < ApplicationController
	def index 
		if params[:performer_id]
			@performers_styles = PerformersStyle.where(:performer_id => params[:performer_id])
		else 
		  @performers_styles = PerformersStyle.all
		end
	end

	def show
    	@performers_style = PerformersStyle.find(params[:id])
	end

	def new 
		@performers_style = PerformersStyle.new
	end

	def edit 
		@performers_style = PerformersStyle.find(params[:id])
	end 

	def create
		@performers_style = PerformersStyle.new(performers_style_params)

		if @performers_style.save
			redirect_to @performers_style
		else
			render 'new'
		end
	end

	def update 
		@performers_style = PerformersStyle.find(params[:id])

		if @performers_style.update(performers_style_params)
			redirect_to @performers_style
		else
			render 'edit'
		end
	end

	def destroy
		@performers_style = PerformersStyle.find(params[:id])
		@performers_style.destroy

		redirect_to performers_styles_path
	end

	private
	 def performers_style_params
		params.require(:performers_style).permit(:performer_id, :style_id)
	 end

end
