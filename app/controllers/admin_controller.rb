class AdminController < ApplicationController
  def index
  end


  def member_city
    members= Member.all
    members=members.group('city').count
    count=[]
    members.each do |k, v|
	     count.push({"y"=> k, "a"=>v})
    end
    p count
    render :json => count
  end


  def member_bd
    members= Member.all
    members=members.group('bd').count
    count=[]
    members.each do |k, v|
	     count.push({"y"=> k, "a"=>v})
    end
    p count
    render :json => count
  end

  def transaction_date
    transaction_dates=Transaction.all
    transaction_dates=transaction_dates.group('transaction_date').count
    count=[]
    transaction_dates.each do |k, v|
	     count.push({"date"=> k, "number"=>v, "number2"=>v+100})
    end
    p count
    render :json => count
  end
end
