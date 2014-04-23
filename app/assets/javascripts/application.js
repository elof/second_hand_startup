// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.pjax

//= require_tree .

$(document).foundation();
$(document).pjax('a', '[data-pjax-container]');
$( "#datepicker" ).datepicker();

// $('#pages').bind('start.pjax', function() { $('#pages').fadeOut(1000) ).bind('end.pjax', function() { $('#pages').fadeIn(1000) });
// $('[data-pjax-container]').bind('pjax:start', function(){$('[data-pjax-container]').fadeOut(500)}).bind('pjax:end', function() { $('[data-pjax-container]').fadeIn(500) });

$('#event_class_button').click(function() {
    location.reload();
});