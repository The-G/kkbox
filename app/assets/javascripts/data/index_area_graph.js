  var area = Morris.Area({
      element: 'morris-area-chart',
      data: [{
          period: '2010 Q1',
          iphone: 2666,
          ipad: null,
          itouch: 2647
      }, {
          period: '2011 Q2',
          iphone: 5670,
          ipad: 4293,
          itouch: 1881
      }, {
          period: '2011 Q3',
          iphone: 4820,
          ipad: 3795,
          itouch: 1588
      }, {
          period: '2011 Q4',
          iphone: 15073,
          ipad: 5967,
          itouch: 5175
      }, {
          period: '2012 Q1',
          iphone: 10687,
          ipad: 4460,
          itouch: 2028
      }, {
          period: '2012 Q2',
          iphone: 8432,
          ipad: 5713,
          itouch: 1791
      }],
      xkey: 'period',
      ykeys: ['iphone', 'ipad', 'itouch'],
      labels: ['iPhone', 'iPad', 'iPod Touch'],
      pointSize: 2,
      hideHover: 'auto',
      resize: true
  });

  area1=[{
        period: '2011 Q3',
        iphone: 4000,
        ipad: 3795,
        itouch: 1588
    }, {
        period: '2011 Q4',
        iphone: 15073,
        ipad: 5967,
        itouch: 5175
    }, {
        period: '2012 Q1',
        iphone: 10687,
        ipad: 4460,
        itouch: 2028
    }, {
        period: '2012 Q2',
        iphone: 8432,
        ipad: 5713,
        itouch: 1791
    }];


  area2=[{
        period: '2015 Q3',
        iphone: 9999,
        ipad: 3795,
        itouch: 1588
    }, {
        period: '2015 Q4',
        iphone: 9999,
        ipad: 5967,
        itouch: 5175
    }, {
        period: '2015 Q1',
        iphone: 9999,
        ipad: 4460,
        itouch: 2028
    }];


    area3=[{
        period: '2015 Q3',
        iphone: 9999,
        ipad: 3795,
        itouch: 1588
    }, {
        period: '2015 Q4',
        iphone: 9999,
        ipad: 5967,
        itouch: 5175
    }];

$(function() {
  $('#action1').click(function() {area.setData(area1);});
  $('#action2').click(function() {area.setData(area2);});
  $('#action3').click(function() { area.setData(area3);});


});
