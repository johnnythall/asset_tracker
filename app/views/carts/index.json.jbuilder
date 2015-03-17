json.array!(@carts) do |cart|
  json.extract! cart, :id, :user_id_id, :asset_id_id
  json.url cart_url(cart, format: :json)
end
