class Asset < ActiveRecord::Base
  belongs_to :category
  belongs_to :rental
  belongs_to :cart
  
  def rent()
    self.available = false
    self.save
  end
    
  def self.barcode_scan(code)
    x = Asset.find_by barcode: code
    return x[:id]
  end
end
