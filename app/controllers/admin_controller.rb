class AdminController < ApplicationController
  before_filter :add_class
   load_and_authorize_resource class: AdminController

   #@@query1=Churn.where('date BETWEEN ? AND ?', '2017-03-01', '2017-03-31').where(predict:1)
   #@@query1=Member.joins("INNER JOIN churns ON members.msno = churns.msno").where('date BETWEEN ? AND ?', '2017-03-01', '2017-03-31').where(predict:1)
   @@query1=Member.find_by_sql "select * from Members, Churns where Members.msno=Churns.msno and Churns.predict=1 and Churns.date BETWEEN '2017-02-01' AND '2017-02-28'"
   @@query1=Member.where(msno: @@query1.map(&:msno))
   @@query2=Transaction.where('membership_expire_date BETWEEN ? AND ?', '2017-03-01', '2017-03-31')
   @@query2=Member.where(msno: @@query2.map(&:msno))
   @@query3=Transaction.where('transaction_date BETWEEN ? AND ?', '2017-02-01', '2017-02-28')
   @@query3=Member.where(msno: @@query3.map(&:msno))
   @@query4=Transaction.where('transaction_date BETWEEN ? AND ?', '2017-02-01', '2017-02-28').where(is_cancel:1)
   @@query4=Member.where(msno: @@query4.map(&:msno))

  def add_class
    params[:controller] = 'Admin'
  end


  def index
    @comments=Comment.all
    @dashboard1 = @@query1.count
    @dashboard2 = @@query2.count
    @dashboard3 = @@query3.count
    @dashboard4 = @@query4.count

  end

  def memberlist
    case params[:table]

      #table_basic
      when "table_basic"
      @members = Member.all
      p @members

      #table_churn
      when "table_churn"
      @members = @@query1
      #@members=Member.find_by_sql "select * from Members m where m.msno=(select DISTINCT n.msno from Members n where n.expected_churn>=0.6)"

      #table_expire
      when "table_expire"
      @members = @@query2
      #@members=Member.find_by_sql "select * from Member where msno=(select DISTINCT msno from transactions where membership_expire_date>=20171201 and is_auto_renew=0)"


      #table_newtran
      when "table_newtran"
      @members = @@query3
      #@members=Member.find_by_sql "select * from Member where msno=(select DISTINCT msno from transactions where transaction_date>=20170201 and transaction_date<20170301 and is_cancel=1)"

      #table_cancel
      when "table_cancel"
      @members = @@query4
      #@members=Member.find_by_sql "select * from Member where msno=(select DISTINCT msno from transactions where transaction_date>=20170201 and transaction_date<20170301 and is_cancel=1)"
    end
  p @members

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

  #jh
  def transaction_is_auto_renew
    #transaction_group_fromto('is_auto_renew', Time.now.strftime("%Y-%m-1"), Time.now.strftime("%Y-%m-31"))
    transaction_group_fromto('is_auto_renew', "2017-03-01","2017-12-31")

  end

  def churn_expect_vs_actual
    churn_actual=Churn.where(actual: "1").group("strftime('%Y-%m', date)").count
    churn_predict=Churn.where(predict: "1").group("strftime('%Y-%m', date)").count
    count=[]
    churn_actual.each do |k, v|
      puts "date: " +k.to_s + "number: "+v.to_s
      count.push({"date"=> k, "number"=>v, "number2"=> churn_predict[k]})
    end
    render :json => count
  end

  def member_registration
    registration = Member.group("strftime('%Y-%m', registration_init_time)").count
    count=[]
    registration.each do |k, v|
      puts "date: " +k.to_s + "number: "+v.to_s
      count.push({"date"=> k, "number"=>v})
    end
    render :json => count
  end

  def transaction_count
    registration = Transaction.group("strftime('%Y-%m', transaction_date)").count
    count=[]
    registration.each do |k, v|
      puts "date: " +k.to_s + "number: "+v.to_s
      count.push({"date"=> k, "number"=>v})
    end
    render :json => count
  end

  def transaction_revenue
    revenue = Transaction.group("strftime('%Y-%m', transaction_date)").sum('actual_amount_paid')
    count=[]
    revenue.each do |k, v|
      puts "date: " +k.to_s + "number: "+v.to_s
      count.push({"date"=> k, "number"=>v})
    end
    render :json => count
  end

private
  #jh
  def transaction_group_fromto(group, begin_day, end_day)
    transaction=Transaction.where('transaction_date BETWEEN ? AND ?', begin_day, end_day).group(group).count
    count=[]
    transaction.each do |k, v|
      puts "key: " +k.to_s + "value: "+v.to_s
      count.push({"label"=> k, "value"=>v})
    end
    render :json => count

  end


  def transaction_group(group)
    transaction=Transaction.group(group).count
    count=[]
    transaction.each do |k, v|
      count.push({"date"=> k, "number"=>v, "number2"=>rand(v-10..v+10)})
    end
    render :json => count

  end

  def member_group(group)
    members=Member.group(group).count.sort{|a,b| b[1]<=>a[1]}.take(5).sort()

    count=[]
    members.each do |k, v|
       count.push({"y"=> k, "a"=>v})
    end
    render :json => count

  end
end
