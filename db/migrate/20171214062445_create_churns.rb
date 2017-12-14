class CreateChurns < ActiveRecord::Migration
  def change
    create_table :churns do |t|
      t.string :msno
      t.date :date
      t.integer :predict
      t.integer :actual

      t.timestamps null: false
    end
  end
end
