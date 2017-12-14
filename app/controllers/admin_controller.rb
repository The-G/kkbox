class AdminController < ApplicationController
  def index
    @comments=Comment.all
  end

  def memberlist
    #@members=Member.order(id: :desc).page params[:page]
    #@members = Member.order("created_at DESC").page(params[:page]).per(10)
    @members = Member.all
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
