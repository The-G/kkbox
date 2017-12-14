  var line;
  function init_line_graph(){
    $.ajax({
      url : "/admin/transaction_date",
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

function line_ajax(method){
  console.log("line_ajax called");
  $.ajax({
        url : "/admin/transaction_" + method,
        type : "post",
        success : function(data) {
          console.log(data);
          console.log(method);
          $('#lineChartTitle').text(method);
          line.setData(data);
        }
  });
}

function reDraw_line(){
    switch (parseInt(Math.random()*2)) {
      case 0:
          line_ajax("date");
          break;
      case 1:
          line_ajax("membership_expire_date");
          break;
  }
}



$(function() {
  init_line_graph();
  $('#line1').click(function() {
      line_ajax("date");
  });
  $('#line2').click(function() {
      line_ajax("membership_expire_date");
  });


  setInterval(function () {
    reDraw_line();
  }, 3000);
});
