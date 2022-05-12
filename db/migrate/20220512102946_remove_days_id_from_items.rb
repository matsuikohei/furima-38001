class RemoveDaysIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :days_id, :integer
  end
end
