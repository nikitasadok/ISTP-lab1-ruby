class FestivalDaysController < ApplicationController
    def index
        if params[:festival_id]
              @festival_days = FestivalDay.where(:festival_id => params[:festival_id])
            else
              @festival_days = FestivalDay.all
            end
    end

    def edit 
		@festival_day = FestivalDay.find(params[:id])
	end 

    def show 
        @festival_day = FestivalDay.find(params[:id])
    end

    def new 
        @festival_day = FestivalDay.new
    end


    def create
        @festival_day = FestivalDay.new(festival_day_params)

        if @festival_day.save
            redirect_to @festival_day
        else 
            render 'new'
        end
    end

    def update 
		@festival_day = FestivalDay.find(params[:id])

		if @festival_day.update(festival_day_params)
			redirect_to @festival_day
		else
			render 'edit'
		end
    end
    
    def destroy
		@festival_day = FestivalDay.find(params[:id])
		@festival_day.destroy

		redirect_to festival_days_path
	end



    def festival_day_params
		params.require(:festival_day).permit(:date, :festival_id)
    end     
end
