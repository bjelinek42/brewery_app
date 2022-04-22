class LocationsController < ApplicationController
  def create
    location = Location.new(
      street: "1936 Snyder Ave",
      city: "Coloraod Springs",
      state: "Colorado",
      country: "United States",
      zipcode: "80909",
      # results = Geocoder.search("#{location.street}, #{location.city}, #{location.state}")
      latitude: Geocoder.search("#{"1936 Snyder Ave"}, #{"Colorado Springs"}, #{"Colorado"}").first.coordinates[0],
      longitude: Geocoder.search("#{"1936 Snyder Ave"}, #{"Colorado Springs"}, #{"Colorado"}").first.coordinates[1]
    )
    location.save
    render json: location
  end

  def show
    location = Location.find(params[:id])
    brewery_distances = []
    nearby_breweries = []
    breweries = Brewery.all
    breweries.each do |brewery|
      coor1 = [location.latitude, location.longitude]
      coor2 = [brewery.latitude, brewery.longitude]
      distance = Geocoder::Calculations.distance_between(coor1, coor2, options ={})
      brewery_distances << {"name" => brewery["name"], "address" => brewery["address"], "distance" => distance}
    end
    brewery_distances = brewery_distances.sort_by { | k | k["distance"] }
    i = 0
    5.times do
      nearby_breweries << brewery_distances[i]
      i += 1
    end
    render json: nearby_breweries
  end

end
