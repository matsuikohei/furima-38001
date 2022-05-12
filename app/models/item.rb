class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :area_id
    validates :days_id
  end

  validates :user, presence: true

end
