class Cart < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :asset_id
  
  def self.empty()
    cart = Cart.all
    cart.each do |i|
      i.destroy
    end
  end
end
