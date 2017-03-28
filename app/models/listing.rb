class Listing < ApplicationRecord
  belongs_to :user
  # has_many :listing_tags
  # has_many :tags, through: :listing_tags
  # has_many :reservations

end
