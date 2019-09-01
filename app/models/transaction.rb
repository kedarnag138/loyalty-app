class Transaction < ApplicationRecord

  # Associations
  belongs_to :user

  geocoded_by latitude: :latitude, longitude: :longitude

  after_create :generate_points_based_on_location

  def generate_points_based_on_location
    latitude = self.latitude
    longitude = self.longitude
    latitude_longitude = "#{latitude},#{longitude}"
    response = Geocoder.search(latitude_longitude).first
  end

end