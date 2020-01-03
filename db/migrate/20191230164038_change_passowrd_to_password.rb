class ChangePassowrdToPassword < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :passowrd, :password
  end
end
