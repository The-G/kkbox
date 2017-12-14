class AdminController < ApplicationController

  before_action :transaction_is_churn, :transaction_this_month_expire_date, :transaction_new_transaction, :transaction_is_cancel

  def index
    @comments=Comment.all
  end

  def memberlist
    #@members=Member.order(id: :desc).page params[:page]
    @members = Member.order("created_at DESC").page(params[:page]).per(10)
    #@transactions=Transaction.order(id: :desc).page params[:page]
  end


  def create_comment
    @comment=Comment.create(
      name: "You",
      comment: params["comment"]
    )
  end


  def member_city
    member_group("city")
  end

  def member_bd
    member_group("bd")
  end

  def member_gender
    members=Member.group("gender").count
    count=[]
    members.each do |k, v|
       count.push({"label"=> k, "value"=>v})
    end
    render :json => count
  end

  def member_register_via
    members=Member.group("registered_via").count
    count=[]
    members.each do |k, v|
       count.push({"label"=> k, "value"=>v})
    end
    render :json => count
  end

  def transaction_date
    transaction_group('transaction_date')
  end

  def transaction_is_auto_renew
    #transaction_group_fromto('is_auto_renew', Time.now.strftime("%Y-%m-1"), Time.now.strftime("%Y-%m-31"))
    transaction_group_fromto('is_auto_renew', "2017-03-01","2017-12-31")
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
=======
  def transaction_is_churn
    transaction_group('is_churn')
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

  def transaction_group_fromto(group, begin_day, end_day)
    transaction=Transaction.where('transaction_date BETWEEN ? AND ?', begin_day, end_day).group(group).count
    count=[]
    transaction.each do |k, v|
      puts "key: " +k.to_s + "value: "+v.to_s
      count.push({"y"=> k, "a"=>v})
    end
    render :json => count
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
