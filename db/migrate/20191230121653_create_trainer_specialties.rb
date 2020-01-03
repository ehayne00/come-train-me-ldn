class CreateTrainerSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :trainer_specialties do |t|
      t.integer :specialty_id
      t.integer :trainer_id

      t.timestamps
    end
  end
end
