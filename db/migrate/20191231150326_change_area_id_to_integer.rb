class ChangeAreaIdToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :area_id, :integer 
    change_column :trainers, :area_id, :integer
  end
end
