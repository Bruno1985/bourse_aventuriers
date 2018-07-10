class PhotosController < ApplicationController
 
 def destroy
 
      @photo = Photo.find(params[:id])
 
       adventure = @photo.adventure
 
  
      @photo.destroy
 
  
      @photos = Photo.where(adventure_id: adventure.id)
 
  
       respond_to :js
 end
 
end