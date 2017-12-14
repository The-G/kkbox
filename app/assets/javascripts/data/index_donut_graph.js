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
             colors: ["coral","lightskyblue","yellow","teal","mediumpurple","mediumblue"]
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
  result=[];
  for(var i =0; i< label.length;i++){
    result.push({
          label: label[i],
          value: data[i].value
        });
  }
  return result;
}


gender = ["Female", "Male"];
registration_via = ["1","2","3","4","5","6"];


function reDraw_donut(){
    switch (setIntervalCount) {
      case 0:
          donut_ajax("/admin/member_gender", gender );
          $('#donutChartTitle').text('GENDER');
          setIntervalCount = 1;
          break;
      case 1:
          donut_ajax("/admin/member_register_via", registration_via );
          $('#donutChartTitle').text('REGISTRAION WAY');
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
