Rails.application.routes.draw do
  get 'admin/index'
  root 'admin#index'
  post 'admin/member_city' => 'admin#member_city'
  post 'admin/member_bd' => 'admin#member_bd'
  post 'admin/member_gender' => 'admin#member_gender'

  post 'admin/transaction_payment_method_id' => 'admin#transaction_payment_method_id'
  post 'admin/transaction_play_days' => 'admin#transaction_play_days'
  post 'admin/transaction_actual_amount_paid' => 'admin#transaction_actual_amount_paid'
  post 'admin/transaction_is_auto_renew' => 'admin#transaction_is_auto_renew'

  post 'admin/transaction_date' => 'admin#transaction_date'
  post 'admin/transaction_membership_expire_date' => 'admin#transaction_membership_expire_date'


  post 'admin/transaction_is_churn' => 'admin#transaction_is_churn'
  post 'admin/transaction_new_transaction' => 'admin#transaction_new_transaction'
  post 'admin/transaction_this_month_expire_date' => 'admin#transaction_this_month_expire_date'
  post 'admin/transaction_is_cancel' => 'admin#transaction_is_cancel'
end
