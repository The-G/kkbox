var donut;

function init_donut_graph(){
  console.log("init_donut_graph_function called");
  $.ajax({
        url : "/admin/member_gender",
        type : "post",
        success : function(data) {
          donut =
          Morris.Donut({
             element: 'morris-donut-chart',
             data: data,
             resize: true
         });
      }
  })
};



function donut_ajax(method){
  console.log("donut_ajax called");
  $.ajax({
        url : "/admin/member_" + method,
        type : "post",
        success : function(data) {
          console.log(data);
          $('#donutChartTitle').text(method);
          donut.setData(data);
        }
  });
}


function reDraw_donut(){
    switch (parseInt(Math.random()*2)) {
      case 0:
          donut_ajax("gender");
          break;
      case 1:
          donut_ajax("register_via");
          break;
  }
}


$(function() {
  init_donut_graph();

  setInterval(function () {
    reDraw_donut();
  }, 1000);

});
