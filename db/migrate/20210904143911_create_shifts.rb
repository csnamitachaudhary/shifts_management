class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :day, default: 0
      t.time :start_time
      t.time :end_time
      t.references :member, foreign_key: true
      t.index [:member_id, :day], unique: true
      t.timestamps
    end
  end
end