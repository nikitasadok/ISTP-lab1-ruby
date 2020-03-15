class ConcertsController < ApplicationController
    def index
        if params[:festival_day_id]
            @concerts = Concert.where(:festival_day_id => params[:festival_day_id])
          else
            @concerts = Concert.all
          end
    end 

    def edit 
		@concert = Concert.find(params[:id])
	end 

    def show 
        @concert = Concert.find(params[:id])
    end

    def new 
        @concert = Concert.new
    end


    def create
        @concert = Concert.new(concert_params)

        if @concert.save
            redirect_to @concert
        else 
            render 'new'
        end
    end

    def update 
		@concert = Concert.find(params[:id])

		if @concert.update(concert_params)
			redirect_to @concert
		else
			render 'edit'
		end
    end
    
    def destroy
		@concert = Concert.find(params[:id])
		@concert.destroy

		redirect_to concerts_path
	end



    def concert_params
        organizer_id = params[:organizer_id]
        
        params.require(:concert).permit(:start_time, :end_time, :festival_day_id)
    end     



end
