class AdminController < ApplicationController
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


private
  def transaction_group(group)
    transaction=Transaction.group(group).count
    count=[]
    transaction.each do |k, v|
      count.push({"date"=> k, "number"=>v, "number2"=>rand(v-10..v+10)})
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
