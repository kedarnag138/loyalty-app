class Transaction < ApplicationRecord

  # Associations
  belongs_to :user

  geocoded_by latitude: :latitude, longitude: :longitude

  validate :generate_points_based_on_location

  def generate_points_based_on_location
    latitude = self.latitude
    longitude = self.longitude
    latitude_longitude = "#{latitude},#{longitude}"
    response = Geocoder.search(latitude_longitude).first
    unless response.data["error"].present?
      if response.data["address"]["country"] == "Singapore"
        if self.amount.to_i >= 100
          Point.create(earned: 10, location: response.data["address"]["country"])
        end
      else
        Point.create(earned: 10 * 2, location: response.data["address"]["country"])
      end
    else
      return errors.add(:base, response.data["error"])
    end
  end

end