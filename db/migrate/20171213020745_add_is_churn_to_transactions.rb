class AddIsChurnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :is_churn, :integer
  end
end
