class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :delivery


  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :area_id
    validates :delivery_id
  end

  validates :user, presence: true
  validates :price, presence: true, format: { with: /3[0-9]|[3-9][0-9]{2,6}/i }

end
