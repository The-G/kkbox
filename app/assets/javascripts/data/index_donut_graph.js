var donut;

function init_donut_graph_gender(){
  console.log("init_donut_graph_gender_function called");
  $.ajax({
        url : "/admin/member_gender",
        type : "post",
        success : function(data) {
          console.log(data);
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
             resize: true
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
    switch (parseInt(Math.random()*2)) {
      case 0:
          console.log("gender");
          donut_ajax("/admin/member_gender", gender );
          $('#donutChartTitle').text('GENDER');
          break;
      case 1:
          console.log("autorenew");
          donut_ajax("/admin/transaction_is_auto_renew", auto_renewal );
          $('#donutChartTitle').text('AUTORENEW');
          break;
  }
}

$(function() {

  init_donut_graph_gender();
  console.log("donut graph done");
  setInterval(function () {
    reDraw_donut();
  }, 1000);

});
