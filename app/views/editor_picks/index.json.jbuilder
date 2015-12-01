json.array!(@editor_picks) do |editor_pick|
  json.extract! editor_pick, :id, :name, :image, :onTop, :description
  json.url editor_pick_url(editor_pick, format: :json)
end
