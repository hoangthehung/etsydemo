json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :p_name, :p_image, :p_price, :p_des, :item, :item_type, :keyword_type
  json.url keyword_url(keyword, format: :json)
end
