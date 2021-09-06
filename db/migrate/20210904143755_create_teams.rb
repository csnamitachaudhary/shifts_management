class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :department, default: 0
      t.string :description
      t.timestamps
    end
  end
end
