json.array!(@stops) do |stop|
  json.extract! stop, :id, :address, :date, :longitude, :latitude, :road_trip_id
  json.url stop_url(stop, format: :json)
end
