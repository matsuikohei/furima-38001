class RemoveSendFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :send_id, :integer
  end
end
