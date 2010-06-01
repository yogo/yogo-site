// window.onload = function(){ alert("welcome"); }

$(document).ready(function(){
  $('#button_1').bind('click', function(){
    all_off();
    $('#button_1_info').fadeIn();
  })
  $('#button_2').bind('click', function(){
    all_off();
    $('#button_2_info').fadeIn();
  })
  $('#button_3').bind('click', function(){
    all_off();
    $('#button_3_info').fadeIn();
  })
  $('#button_4').bind('click', function(){
    all_off();
    $('#button_4_info').fadeIn();
  })
});

function all_off(){
  $('#button_1_info').fadeOut();
  $('#button_2_info').fadeOut();
  $('#button_3_info').fadeOut();
  $('#button_4_info').fadeOut();
}