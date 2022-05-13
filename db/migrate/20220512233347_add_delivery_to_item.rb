class AddDeliveryToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_id, :integer
  end
end
