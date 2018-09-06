class PagesController < ApplicationController
  before_action :new_search, only: %i[home search]

  def home
    @adventures = Adventure.order("RANDOM()").limit(9)
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:bourse_aventuriers_search] = params[:search]
    end

    @adventures_to_array = @search.result.to_a
  end

  private

  def new_search
    @search = Adventure.active.ransack(params[:q])
  end
end
