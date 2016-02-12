$(function() {
  $(document).on('click', '.captcha', reload_captcha);
});

function reload_captcha() {
  img = $(this).find('img');
  img.context.src = img.context.src.split('?')[0] + '?' + (new Date()).getTime();
}
