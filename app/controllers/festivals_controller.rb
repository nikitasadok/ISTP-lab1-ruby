class FestivalsController < ApplicationController
    def index
        @festivals = Festival.all
    end 

    def edit 
		@festival = Festival.find(params[:id])
	end 

    def show 
        @festival = Festival.find(params[:id])
    end

    def new 
        @festival = Festival.new
    end


    def create
        @festival = Festival.new(festival_params)

        if @festival.save
            redirect_to @festival
        else 
            render 'new'
        end
    end

    def update 
		@festival = Festival.find(params[:id])

		if @festival.update(festival_params)
			redirect_to @festival
		else
			render 'edit'
		end
    end
    
    def destroy
		@festival = Festival.find(params[:id])
		@festival.destroy

		redirect_to festivals_path
	end



    def festival_params
        organizer_id = params[:organizer_id]
        
        params.require(:festival).permit(:name, :start_date, :end_date, :organizer_id)
    end     
end
