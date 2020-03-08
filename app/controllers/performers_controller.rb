class PerformersController < ApplicationController
        def index 
            @performers = Performer.all
        end
    
        def show
            @performer = Performer.find(params[:id])
        end
    
        def new 
            @performer = Performer.new
        end
    
        def edit 
            @performer = Performer.find(params[:id])
        end 
    
        def create
            @performer = Performer.new(performer_params)
    
            if @performer.save
                redirect_to @performer
            else
                render 'new'
            end
        end
    
        def update 
            @performer = Performer.find(params[:id])
    
            if @performer.update(performer_params)
                redirect_to @performer
            else
                render 'edit'
            end
        end
    
        def destroy
            @performer = Performer.find(params[:id])
            @performer.destroy
    
            redirect_to performers_path
        end
    
        private
         def performer_params
            params.require(:performer).permit(:name)
         end
end
