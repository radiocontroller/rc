$(function() {
  $(document).on('click', '.captcha', reload_captcha);
});

function reload_captcha() {
  var img = $('.rucaptcha-image')[0];
  img.src = img.src.split('?')[0] + '?' + (new Date()).getTime();
}
