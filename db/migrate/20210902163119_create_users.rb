class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.date :date_of_birth
      t.string :password_digest
      t.bigint :mobile
      t.timestamps
    end
  end
end
