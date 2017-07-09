class AddUserIdToMix < ActiveRecord::Migration[5.0]
  def change
    add_column :mixes, :user_id, :integer
  end
end
