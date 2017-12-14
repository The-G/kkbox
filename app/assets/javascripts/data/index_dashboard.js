

function dashboard_ajax(method, key, id){
  $.ajax({
        url : "/admin/transaction_" + method,
        type : "post",
        success : function(values) {
          var html = "<p>" + values[0][key] + "</p>"
          $(id).append(html);
          console.log("dashboard_ajax 실행");
        }
  })

}


$(function() {
    dashboard_ajax("is_churn",'count_is_churn','#is_churn');
    dashboard_ajax("this_month_expire_date",'count_expire_date','#is_expire_date');
    dashboard_ajax("new_transaction",'count_new_transaction','#is_transaction_date');
    dashboard_ajax("is_cancel",'count_is_cancel','#is_cancel');
});
