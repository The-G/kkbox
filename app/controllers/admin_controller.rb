class AdminController < ApplicationController

  before_action :transaction_is_churn, :transaction_this_month_expire_date, :transaction_new_transaction, :transaction_is_cancel

  def index

  end


  def member_city
    member_group("city")
  end

  def member_bd
    member_group("bd")
  end

  def member_gender
    member_group("gender")
  end

  def transaction_date
    transaction_group('transaction_date')
  end

  def transaction_membership_expire_date
    transaction_group('membership_expire_date')
  end

 def transaction_is_churn
   transaction_this_group('is_predictedChurn')
 end

 def transaction_this_month_expire_date
   transaction_this_group('membership_expire_date')
 end

 def transaction_new_transaction
   transaction_last_group('transaction_date')
 end

 def  transaction_is_cancel
   transaction_last_group('is_cancel')
 end

private
  def transaction_group(group)
    transaction=Transaction.group(group).count
    count=[]
    transaction.each do |k, v|
      count.push({"date"=> k, "number"=>v, "number2"=>rand(v-10..v+10)}, "")
    end
    render :json => count
  end

  def transaction_this_group(group)
    transaction = Transaction.group(group).count
    values=[]
    count_is_churn = 0
    count_membership_expire_date = 0
    transaction.each do |k|
      if is_predictedChurn==1
        count_is_churn += 1
      end
      if transaction.membership_expire_date.strftime("%Y") == Time.now.strftime("%Y") && transaction.membership_expire_date.strftime("%m") == Time.now.strftime("%m")
        count_membership_expire_date += 1
      end
      values.push({"count_is_churn"=>count_is_churn, "count_membership_expire_date"=>count_membership_expire_date})
    end
    render :json => values
  end

  def transaction_last_group(group)
    transaction = Transaction.group(group).count
    values=[]
    count_new_transaction = 0
    count_is_cancel = 0
    transaction.each do |k|
      if transaction.membership_expire_date.strftime("%Y") == Time.now.strftime("%Y") && transaction.membership_expire_date.strftime("%m") == Time.now.strftime("%m")-1 && transaction.is_cancel ==1
        count_is_cancel += 1
      end
      if transaction.transaction_date.strftime("%Y") == Time.now.strftime("%Y") && transaction.transaction_date.strftime("%m") == Time.now.strftime("%m")-1
        count_new_transaction += 1
      end
      values.push({"count_is_cancel"=>count_is_cancel, "count_new_transaction"=>count_new_transaction})
    end
    render :json => values
  end

  def member_group(group)
    members=Member.group(group).count
    count=[]
    members.each do |k, v|
       count.push({"y"=> k, "a"=>v})
    end
    render :json => count
  end

end
