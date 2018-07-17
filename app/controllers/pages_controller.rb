class PagesController < ApplicationController
    def home
      @adventures = Adventure.order("RANDOM()").limit(9)
    end
    
    def search
              if params[:search].present? && params[:search].strip != ""
                 session[:bourse_aventuriers_search] = params[:search]
              end
      
              arrResult = Array.new
      
              if session[:bourse_aventuriers_search] && session[:bourse_aventuriers_search] != ""
                 @adventures_address = Adventure.where(active: true).near(session[:bourse_aventuriers_search], 5, order:'distance')
              else
                 @adventures_address = Adventure.where(active: true).all
              end
      
              @search = @adventures_address.ransack(params[:q])
              @adventures = @search.result
      
              @arrAdventures = @adventures.to_a
      
              if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)
                 start_date = Date.parse(params[:start_date])
                 end_date = Date.parse(params[:end_date])
         
                 @adventures.each do |adventure|
                    not_available = adventure.reservations.where("(? <= start_date AND start_date <= ?) OR 
                    (? <= end_date AND end_date <= ?) OR (start_date < ? AND ? < end_date)", start_date, end_date,
                    start_date, end_date, start_date, end_date).limit(1)
            
                    if not_available.length > 0
                       @arrAdventures.delete(adventure)
                    end
                 end
              end
           end
  
end