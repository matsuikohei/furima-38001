class SoldItemShipping
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :building, :phone, :sold_item_id, :user_id, :item_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone, format: {with: /[0-9]{10,11}/}
    validates :user_id
    validates :item_id
  end

  def save
    sold_item = SoldItem.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal: postal, area_id: area_id, city: city, address: address, building: building, phone: phone, sold_item_id: sold_item.id)
  end
end