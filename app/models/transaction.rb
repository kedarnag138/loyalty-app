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
    if response.data["address"]["country"] == "Singapore"
      if self.amount.to_i >= 100
        Point.create(value: 10, location: response.data["address"]["country"])
      end
    else
      Point.create(value: 10 * 2, location: response.data["address"]["country"])
    end
  end

end