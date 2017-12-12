class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :msno
      t.integer :city
      t.integer :bd
      t.string :gender
      t.integer :registered_via
      t.date :registration_init_time

      t.timestamps null: false
    end
  end
end
