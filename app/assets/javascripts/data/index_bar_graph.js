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
                  labels: ['인원수'],
                  hideHover: 'auto',
                  barColors: ["blue","red","pink","green","yellow","purple"],
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

$(function() {
  init_bar_graph();
  $('#bar1').click(function() {
      bar_ajax("city");
  });
  $('#bar2').click(function() {
    bar_ajax("bd");
  });
  // setInterval(function () {
  //   reDraw_bar();
  // }, 2000);
});
