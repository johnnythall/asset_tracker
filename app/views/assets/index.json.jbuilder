json.array!(@assets) do |asset|
  json.extract! asset, :id, :barcode, :name, :description, :category_id, :location, :value, :access_level, :available
  json.url asset_url(asset, format: :json)
end
