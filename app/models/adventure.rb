class Adventure < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_many :photos
  has_many :reviews

  validates :main_activity, presence: true
  validates :number_of_teammates, presence: true
  validates :duration, presence: true
  validates :listing_name, presence: true, length: {maximum: 75}
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :level, presence: true
  validates :countries, presence: true

  after_validation :geocode, if: :address_changed?
  geocoded_by :address

  scope :active, -> { where(active: true) }

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
   end
end
