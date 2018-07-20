class AdventuresController < ApplicationController

  before_action :set_adventure, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @adventures = current_user.adventures
  end
  
  def new
    @adventure = current_user.adventures.build
  end
  
  def create
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      if params[:images]
             params[:images].each do |i|
                  @adventure.photos.create(image: i)
         end
       end
       @photos = @adventure.photos
       redirect_to edit_adventure_path(@adventure), notice:"Votre aventure a été ajoutée"
    else
      render :new
    end
  end
  
  def show
    @photos = @adventure.photos 
    
    @reviews = @adventure.reviews
     
        if current_user
     
              #@booked = Reservation.where("adventure_id = ? AND user_id = ?", @adventure.id, current_user.id).present? 
     
              @hasReview = @reviews.find_by(user_id: current_user.id)
     
        end
    
  end
  
  def edit
    @photos = @adventure.photos
  end
  
  def update
    if @adventure.update(adventure_params)
      if params[:images]
             params[:images].each do |i|
                  @adventure.photos.create(image: i)
        end
       end
       redirect_to edit_adventure_path(@adventure), notice:"Modification enregistrée..."
    else
      render :edit
    end
  end
  
private
  
  def set_adventure
    @adventure = Adventure.find(params[:id])
  end 
  
  def adventure_params
    params.require(:adventure).permit(:main_activity, :number_of_teammates, :date_of_departure, :duration, :listing_name, :summary, :address, :is_trekking, :is_trail, :is_alpinism, :is_climbing, :is_cycling, :is_alpinism, :is_motorbike, :is_sailing, :is_camping, :is_skiing, :is_fishing, :is_mountain_bike, :is_kayaking, :is_diving, :is_dog_sledding, :is_horse_riding, :is_paragliding, :price, :active, :level)

  end
  
  def require_same_user
            if current_user.id != @adventure.user_id
                 flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
                 redirect_to root_path
            end
   end

end