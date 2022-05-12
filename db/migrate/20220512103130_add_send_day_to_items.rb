class AddSendDayToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :send_id, :integer
  end
end
