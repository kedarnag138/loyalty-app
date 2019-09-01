class Transaction < ApplicationRecord

  # Associations
  belongs_to :user

  geocoded_by latitude: :latitude, longitude: :longitude
end