class AddIsPredictedChurnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :is_predictedChurn, :integer
  end
end
