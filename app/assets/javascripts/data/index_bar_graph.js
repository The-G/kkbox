var bar;
function init_bar_graph(){
  console.log("init_bar_graph_function called");
  $.ajax({
        url : "/admin/member_city",
        type : "post",
        success : function(data) {
          bar =
            Morris.Bar({
                  element: 'morris-bar-chart',
                  data: data,
                  xkey: 'y',
                  ykeys: ['a'],
                  labels: ['Series A'],
                  hideHover: 'auto',
                  resize: true
            });
      }
  })
};

function bar_ajax(method){
  console.log("bar_ajax called");
  $.ajax({
        url : "/admin/member_" + method,
        type : "post",
        success : function(data) {
          console.log(data);
          $('#barChartTitle').text(method);
          bar.setData(data);
        }
  });
}


function reDraw_bar(){
    switch (parseInt(Math.random()*3)) {
      case 0:
          bar_ajax("city");
          break;
      case 1:
          bar_ajax("bd");
          break;
      case 2:
          bar_ajax("gender");
          break;
  }
}



$(function() {
  init_bar_graph();
  $('#bar1').click(function() {
      bar_ajax("city");
  });
  $('#bar2').click(function() {
    bar_ajax("bd");
  });
  $('#bar3').click(function() {
    bar_ajax("gender");
  });

  setInterval(function () {
    reDraw_bar();
  }, 2000);
});
