function insertFloatWindow(html) {
  addMask();
  $('#floatWindow').html(html);
}

function emptyFloatWindow() {
  $('#floatWindow').html('');
  removeMask();
}

function addMask() {
  $('body').append('<div class="sweet-overlay" tabindex="-1" style="opacity: 1.06; display: block;"></div>');
}

function removeMask() {
  $('.sweet-overlay').remove();
}

$(document).ready(function() {
  $(document).on('click', '#js-cancel', emptyFloatWindow);
});
