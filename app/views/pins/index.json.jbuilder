json.array!(@pins) do |pin|
  json.extract! pin, :id, :title, :desc
  json.url pin_url(pin, format: :json)
end
