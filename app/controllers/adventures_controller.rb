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
       redirect_to edit_adventure_path(@adventure), notice:"Votre logement a été ajouté"
    else
      render :new
    end
  end
  
  def show
    @photos = @adventure.photos 
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
    params.require(:adventure).permit(:home_type, :adventure_type, :accomodate, :bed_adventure, :bath_adventure, :listing_name, :summary, :adress, :is_wifi, :is_tv, :is_closet, :is_shampoo, :is_breakfast, :is_heating, :is_air, :is_kitchen, :price, :active)
  end
  
  def require_same_user
            if current_user.id != @adventure.user_id
                 flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
                 redirect_to root_path
            end
   end

end