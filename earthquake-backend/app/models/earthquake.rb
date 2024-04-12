require 'net/http'
class Earthquake < ApplicationRecord
  self.primary_key = 'id'
  def self.populate_db
    uri = URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson')
    response = Net::HTTP.get_response(uri)
    puts 'Populating DB...'
    data = JSON.parse(response.body)
    Earthquake.destroy_all
    puts 'Number of earthquakes : ', data['features'].length
    for earthquake in data['features'] do
      Earthquake.create(id: earthquake['id'], mag: earthquake['properties']['mag'],
        place: earthquake['properties']['place'], time: earthquake['properties']['time'],
        url: earthquake['properties']['url'], tsunami: earthquake['properties']['tsunami'],
        magType: earthquake['properties']['magType'], title: earthquake['properties']['title'],
        longitude: earthquake['geometry']['coordinates'][0], latitude: earthquake['geometry']['coordinates'][1])
    end
  end
end
