$(function(){
  $("#DateCountdown").TimeCircles({
    start: false,
    count_past_zero: false,
    "animation": "smooth",
    "bg_width": 1.2,
    "fg_width": 0.1,
    "circle_bg_color": "#60686F",
    "time": {
        "Days": {
            "text": "Days",
            "color": "#FFCC66",
            "show": false
        },
        "Hours": {
            "text": "Hours",
            "color": "#99CCFF",
            "show": true
        },
        "Minutes": {
            "text": "Minutes",
            "color": "#BBFFBB",
            "show": true
        },
        "Seconds": {
            "text": "Seconds",
            "color": "#FF9999",
            "show": true
        }
    }
  });
  $(".start").click(function(){ $("#DateCountdown").TimeCircles().start(); });
  $(".stop").click(function(){ $("#DateCountdown").TimeCircles().stop(); });
  $(".restart").click(function(){ $("#DateCountdown").TimeCircles().restart(); }); 

  $("#DateCountdown").TimeCircles().end().$('form').submit(); 
});