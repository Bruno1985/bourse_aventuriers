class Adventure < ApplicationRecord
  belongs_to :user
  
validates :main_activity, presence: true 

validates :number_of_teammates, presence: true

validates :date_of_departure, presence: true 

validates :duration, presence: true   
 
validates :listing_name, presence: true, length: {maximum: 75} 
               
validates :summary, presence: true, length: {maximum: 600}
 
validates :address, presence: true
 
#validates :price, numericality: { only_integer: true, greater_than: 5 } 

end
