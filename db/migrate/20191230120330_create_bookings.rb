class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :time
      t.integer :user_id
      t.integer :trainer_id

      t.timestamps
    end
  end
end
