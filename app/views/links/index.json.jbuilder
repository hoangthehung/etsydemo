json.array!(@links) do |link|
  json.extract! link, :id, :url, :orginal
  json.url link_url(link, format: :json)
end
