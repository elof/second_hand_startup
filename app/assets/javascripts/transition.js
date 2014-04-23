var duration = 1000;
var target = "";
$('a').delegate('a.pjax', 'click', function() {
var target = $(this).attr('href');
$('[data-pjax-container]').fadeOut(duration, function() {
$.pjax({
url: target,
container: '[data-pjax-container]',
fragment: '[data-pjax-container]'
})
})
return false;
})
$('[data-pjax-container]')
.on('pjax:start', function() {
$(this).fadeOut(0)
})
.on('pjax:send', function() {
$('.loader').show()
})
.on('pjax:success', function() {
$('.loader').hide()
})
.on('pjax:end', function() {
$(this).fadeIn(duration)
})