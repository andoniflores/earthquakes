require 'net/http'
class Earthquake < ApplicationRecord
  def self.populate_db
    uri = URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson')
    response = Net::HTTP.get_response(uri)
    puts 'Populating DB...'
    data = JSON.parse(response.body)
    puts data['features'].fetch(1)
  end
end
