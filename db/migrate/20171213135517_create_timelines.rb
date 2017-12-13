class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :subject
      t.string :content

      t.timestamps null: false
    end
  end
end
