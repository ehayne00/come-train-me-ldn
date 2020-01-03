class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :passowrd
      t.string :name
      t.integer :age
      t.string :gender
      t.string :email
      t.string :area

      t.timestamps
    end
  end
end
