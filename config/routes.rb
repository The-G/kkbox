Rails.application.routes.draw do
  get 'user/index'

  get 'admin/index'

  get 'admin/memberlist'
  get 'page/tables'
  get 'page/forms'
  get 'page/panels_wells'
  get 'page/buttons'
  get 'page/notifications'
  get 'page/typography'
  get 'page/icons'
  get 'page/grid'
  get 'page/blank'
  get 'page/login'
  get 'page/flot'
  get 'page/morris'


  post 'admin/create_comment' => 'admin#create_comment'

  root 'admin#index'
  post 'admin/member_city' => 'admin#member_city'
  post 'admin/member_bd' => 'admin#member_bd'
  post 'admin/member_gender' => 'admin#member_gender'
  post 'admin/member_register_via' =>'admin#member_register_via'

  post 'admin/transaction_payment_method_id' => 'admin#transaction_payment_method_id'
  post 'admin/transaction_play_days' => 'admin#transaction_play_days'
  post 'admin/transaction_actual_amount_paid' => 'admin#transaction_actual_amount_paid'
  post 'admin/transaction_is_auto_renew' => 'admin#transaction_is_auto_renew'

  post 'admin/transaction_date' => 'admin#transaction_date'
  post 'admin/transaction_membership_expire_date' => 'admin#transaction_membership_expire_date'
end
