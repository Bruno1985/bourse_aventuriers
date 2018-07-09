class AdventuresController < ApplicationController
  
   before_action :set_adventure, only: [:show, :edit, :update]
   before_action :authenticate_user!, except: [:show] 
  
  def index
 
      @adventures = current_user.adventures 
 
  end
  
  def new
 
   @adventure = current_user.adventures.build
 
  end
 
  def create
 
        @adventure = current_user.adventures.build(room_params)
 
        if @adventure.save
 
              redirect_to @adventure, notice:"Votre annonce a été ajouté avec succès" 
 
        else
 
             render :new
 
        end
 
   end
   
   def update
 
          if @adventure.update(adventure_params)
 
                 redirect to @adventure, notice:"Modification enregistrée..."
 
          else
 
              render :edit
 
          end
 
    end
  
  
  private
 
        def set_adventure
 
          @adventure = Adventure.find(params[:id])
 
        end
        
        def room_params
          
           params.require(:adventure).permit(:main_activity, :number_of_teammates, :date_of_departure, :duration, :listing_name, :summary, :address, :is_trekking, :is_trail, :is_alpinism, :is_climbing, :is_cycling, :is_alpinism, :is_motorbike, :is_sailing, :is_camping, :is_skiing, :is_fishing, :is_mountain_bike, :is_kayaking, :is_diving, :is_dog_sledding, :is_horse_riding, :is_paragliding, :price, :active)
         
         end
 
end