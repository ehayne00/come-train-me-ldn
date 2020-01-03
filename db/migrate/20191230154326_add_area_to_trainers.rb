class AddAreaToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :area, :string
  end
end
