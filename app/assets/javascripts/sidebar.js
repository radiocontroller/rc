jQuery.fn.slideRightHide = function(speed, callback) {
  this.animate({
      width : "hide",
      paddingLeft : "hide",
      paddingRight : "hide",
      marginLeft : "hide",
      marginRight : "hide"
  }, speed, hideSidebarWrap);
};

jQuery.fn.slideLeftShow = function(speed, callback) {
  this.animate({
      width : "show",
      paddingLeft : "show",
      paddingRight : "show",
      marginLeft : "show",
      marginRight : "show"
  }, speed, callback);
};

$(document).ready(function() {
  $(document).on('click', '.setting', showSidebar);
  $(document).on('click', hideSidebar);
});

function showSidebar() {
  $('.right-sidebar-wrap').show();
  $('.sidebar').slideLeftShow(200);
}

function hideSidebar(e) {
  if($(e.target).attr('class') == 'right-sidebar-wrap')
    $('.sidebar').slideRightHide(200);
}

function hideSidebarWrap() {
  $('.right-sidebar-wrap').hide();
}
