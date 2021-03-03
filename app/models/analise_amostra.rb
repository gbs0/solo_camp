class AnaliseAmostra < ApplicationRecord
  belongs_to :user
  belongs_to :analise

  def self.append_json_attrs(json)
    listing = find_by(sku: sku) || Listing.new(sku: sku)
    listing.vendors_will_change!
    listing.vendors[:hd].merge!({ foo: 'bar' })
    listing.save! # throws no exceptions in the log
  end
end
