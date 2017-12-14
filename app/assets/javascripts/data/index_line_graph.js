  var line;
  function init_line_graph(){
    $.ajax({
      url : "/admin/churn_expect_vs_actual",
      type : "post",
      success : function(data) {
        $('#lineChartTitle').text("Churn_Expect vs Actual");
        line =
          Morris.Line({
            element: 'morris-line-chart',
            data: data,
            xkey: 'date',
            ykeys: ['number','number2'],
            labels: ['number', 'number2'],
            pointSize: 2,
            hideHover: 'auto',
            lineColors: ["red","blue"],
            resize: true
          });
      }
    })
  }

function line_ajax(url,title){
  console.log("line_ajax called");
  $.ajax({
        url : url,
        type : "post",
        success : function(data) {
          console.log(data);
          $('#lineChartTitle').text(title);
          line.setData(data);
        }
  });
}

$(function() {
  init_line_graph();
  $('#line1').click(function() {
      line_ajax("/admin/churn_expect_vs_actual","Churn_Expect vs Actual");
  });
  $('#line2').click(function() {
      line_ajax("/admin/member_registration","REGISTRATION COUNT");
  });

  $('#line3').click(function() {
      line_ajax("/admin/transaction_count","PRODUCT COUNT");
  });

  $('#line4').click(function() {
      line_ajax("/admin/transaction_revenue","SALES TREND");
  });


});
