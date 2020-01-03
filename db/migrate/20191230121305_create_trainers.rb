class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :price
      t.string :username
      t.string :password
      t.string :name
      t.string :email
      t.string :image
      t.string :specialty
      t.string :bio
      t.string :gender

      t.timestamps
    end
  end
end
