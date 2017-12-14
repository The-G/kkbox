class AdminController < ApplicationController

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
    transaction_group('transaction_date',"")
  end

  def transaction_membership_expire_date
    transaction_group('membership_expire_date',"")
  end

  def transaction_is_churn
   transaction_group('is_predictedChurn',"count_is_churn")
  end

 def transaction_this_month_expire_date
   transaction_transaction_group('membership_expire_date','2017-03-1','2017-03-31',"count_expire_date")
 end

 def transaction_new_transaction
   transaction_transaction_group('transaction_date','2017-02-1','2017-02-31',"count_new_transaction")
 end

 def  transaction_is_cancel
   transaction_is_cancel_group('is_cancel')
 end


private

  def transaction_group(group, key)
      transaction=Transaction.group(group).count
      count=[]
      transaction.each do |k, v|
        count.push({"date"=> k, "number"=>v, "number2"=>rand(v-10..v+10), key => transaction[1]})
      end
      render :json => count
  end

  def transaction_transaction_group(group, begin_day, end_day, key)
      transaction = Transaction.where(group+' between ? and ?', begin_day, end_day).group(group).count()
      values=[]
      values.push({key=>transaction.count})
      render :json => values
  end

  def transaction_is_cancel_group(group)
    transaction = Transaction.where('transaction_date between ? and ? and is_cancel = ?', '2017-02-1', '2017-02-31','1').group(group).count()
    values=[]
    values.push({"count_is_cancel"=>transaction.count})
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
