json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :id, :origin, :destination, :start_date, :end_date
  json.url itinerary_url(itinerary, format: :json)
end
