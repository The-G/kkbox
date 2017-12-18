var donut;
var setIntervalCount = 0;

function init_donut_graph(){
  console.log("init_donut_graph_function called");
  $.ajax({
        url : "/admin/member_gender",
        type : "post",
        success : function(data) {
          donut =
          Morris.Donut({
             element: 'morris-donut-chart',
             data: [{
                label: "Female",
                value: data[0].value
              }, {
                label: "Male",
                value: data[1].value
              }],
             resize: true,
             colors: ["coral","deepskyblue","black","green","darkorange","yellow"]
         });
      }
  })
};


function donut_ajax(url, label){
  console.log("init_donut_graph_called");
  $.ajax({
      url : url,
      type : "post",
      success : function(data){
        data=make_input(label, data);
        donut.setData(data);
      }
  })
};

function make_input(label,data) {
  result = [{
        label: label[0],
        value: data[0].value
        }, {
        label: label[1],
        value: data[1].value
        }];
  return result;
}


gender = ["Female", "Male"];
auto_renewal = ["None Auto","Auto Renewal"];


function reDraw_donut(){
    switch (setIntervalCount) {
      case 0:
          donut_ajax("/admin/member_gender", gender );
          $('#donutChartTitle').text('GENDER');
          setIntervalCount = 1;
          break;
      case 1:
          donut_ajax("/admin/transaction_is_auto_renew", auto_renewal );
          $('#donutChartTitle').text('AUTORENEW');
          setIntervalCount = 0;
          break;
  }
}


$(function() {
  init_donut_graph();

  setInterval(function () {
    reDraw_donut();
  }, 2000);

});
