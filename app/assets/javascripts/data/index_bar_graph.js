var bar;
function init_bar_graph(){
  console.log("init_bar_graph_function called");
  $.ajax({
        url : "/admin/member_city",
        type : "post",
        success : function(data) {
          $('#barChartTitle').text("CITY");
          console.log(data);
          bar =
            Morris.Bar({
                  element: 'morris-bar-chart',
                  data: data,
                  xkey: 'y',
                  ykeys: ['a'],
                  labels: ['인원수'],
                  //barColors: ["blue","red","pink","green","yellow","purple"],
                  //barColors: ["teal","coral","yellow","lightskyblue","mediumpurple","mediumblue"],
                // barColors: function (row, series, type) {
                //   if (type === 'bar') {
                //     var red = Math.ceil(255 * row.y / this.ymax);
                //     return 'rgb(' + red + ',0,0)';
                //   }
                //   else {
                //     return '#000';
                //   }
                // },
                barColors: function (row, series, type) {
                  console.log("--> "+row.label, series, type);
                  if(row.label == "1") return "#AD1D28";
                  else if(row.label == "2") return "#DEBB27";
                  else if(row.label == "3") return "#fec04c";
                  else if(row.label == "4") return "#1AB244";
                  else if(row.label == "5") return "lightskyblue";
                  else if(row.label == "7") return "lightgreen";
                  else return "blue";
                },

                  hideHover: 'auto',
                  resize: true
            });
      }
  })
};

function bar_ajax(method,title){
  console.log("bar_ajax called");
  $.ajax({
        url : "/admin/member_" + method,
        type : "post",
        success : function(data) {
          console.log(data);
          $('#barChartTitle').text(title);
          bar.setData(data);
        }
  });
}

$(function() {
  init_bar_graph();
  $('#bar1').click(function() {
      bar_ajax("city","CITY");
  });
  $('#bar2').click(function() {
      bar_ajax("bd","AGE");
  });
  // setInterval(function () {
  //   reDraw_bar();
  // }, 2000);
});
