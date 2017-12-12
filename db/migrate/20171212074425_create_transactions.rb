class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :msno
      t.integer :payment
      t.integer :payment_plan_days
      t.integer :plan_list_price
      t.integer :actual_amount_paid
      t.integer :is_auto_renew
      t.date :transaction_date
      t.date :membership_expire_date
      t.integer :is_cancel
      t.timestamps null: false
    end
  end
end
