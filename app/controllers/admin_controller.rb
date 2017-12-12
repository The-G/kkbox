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
end
