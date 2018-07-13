class Adventure < ApplicationRecord

belongs_to :user
has_many :photos
has_many :reviews
  
validates :main_activity, presence: true
validates :number_of_teammates, presence: true
validates :duration, presence: true 
validates :listing_name, presence: true, length: {maximum: 75}               
validates :summary, presence: true, length: {maximum: 600} 
validates :address, presence: true

geocoded_by :address
after_validation :geocode, if: :address_changed?

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
   end

end
