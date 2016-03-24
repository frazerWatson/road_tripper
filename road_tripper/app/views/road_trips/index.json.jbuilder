json.array!(@road_trips) do |road_trip|
  json.extract! road_trip, :id, :title
  json.url road_trip_url(road_trip, format: :json)
end
