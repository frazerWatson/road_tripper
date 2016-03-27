json.array!(@stops) do |stop|
  json.extract! stop, :id, :location, :date
  json.url stop_url(stop, format: :json)
end
