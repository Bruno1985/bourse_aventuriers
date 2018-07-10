class Adventure < ApplicationRecord

belongs_to :user
has_many :photos
  
validates :main_activity, presence: true
validates :number_of_teammates, presence: true
validates :duration, presence: true 
validates :listing_name, presence: true, length: {maximum: 75}               
validates :summary, presence: true, length: {maximum: 600} 
validates :address, presence: true
end
