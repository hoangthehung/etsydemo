json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :description, :fb_page
  json.url shop_url(shop, format: :json)
end
