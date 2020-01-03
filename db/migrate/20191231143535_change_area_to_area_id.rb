class ChangeAreaToAreaId < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :area, :area_id
    rename_column :trainers, :area, :area_id
  end
end
