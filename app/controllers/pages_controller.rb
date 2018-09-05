class PagesController < ApplicationController
    def home
      @adventures = Adventure.order("created_at DESC").limit(4)
    end
    
    def search
                  if params[:search].present? && params[:search].strip != ""
                     session[:bourse_aventuriers_search] = params[:search]
                  end
      
                  arrResult = Array.new
      
                  if session[:bourse_aventuriers_search] && session[:bourse_aventuriers_search] != ""
                    @adventures_main_activity = Adventure.where(active: true).all
                  else
                     @adventures_main_activity = Adventure.where(active: true).all
                  end
      
                  @search = @adventures_main_activity.ransack(params[:q])
                  @adventures = @search.result.page(params[:page]).per(2)
      
                  @arrAdventures = @adventures.to_a
                end
      

end