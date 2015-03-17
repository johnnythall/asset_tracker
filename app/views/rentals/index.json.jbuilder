json.array!(@rentals) do |rental|
  json.extract! rental, :id, :asset_id_id, :user_id_id, :rented_by_id, :start_date, :end_date
  json.url rental_url(rental, format: :json)
end
