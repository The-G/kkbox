  var line;
  function init_line_graph(){
    $.ajax({
      url : "/admin/churn_expect_vs_actual",
      type : "post",
      success : function(data) {
        line =
          Morris.Line({
            element: 'morris-line-chart',
            data: data,
            xkey: 'date',
            ykeys: ['number','number2'],
            labels: ['number', 'number2'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
          });
      }
    })
  }

function line_ajax(url){
  console.log("line_ajax called");
  $.ajax({
        url : url,
        type : "post",
        success : function(data) {
          console.log(data);
          $('#lineChartTitle').text(url);
          line.setData(data);
        }
  });
}

$(function() {
  init_line_graph();
  $('#line1').click(function() {
      line_ajax("/admin/churn_expect_vs_actual");
  });
  $('#line2').click(function() {
      line_ajax("/admin/member_registration");
  });

  $('#line3').click(function() {
      line_ajax("/admin/transaction_count");
  });

  $('#line4').click(function() {
      line_ajax("/admin/transaction_revenue");
  });


});
