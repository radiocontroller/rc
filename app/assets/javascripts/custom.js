$(function() {
  initializeFancyBox();
  initializeLazyLoad();
  articleFormSubmit();
  $(document).on('click', '.left-sidebar-title', slideToggle);
  $(document).on('click', '.captcha', reloadCaptcha);
  $(document).on('click', '.js-remove-article', deleteArticle);
  $(document).on('click', '.js-delete-plane', deleteBattlePlane);
  $(document).on('click', '.js-delete-gallery', deleteGallery);
  $(document).on('click', '.js-edit-video', editVideo);
  $(document).on('click', '.js-delete-video', deleteVideo);
  $(document).on('click', '.reply .js-delete-comment', deleteComment);
  $(document).on('click', '.js-set-homepage', setHomepage);
});

function initializeFancyBox() {
  $(".fancybox").fancybox({
    maxWidth: 900,
    openEffect: 'elastic'
  });
}

function initializeLazyLoad() {
  $("img.lazy").lazyload({effect: "fadeIn"});
}

function articleFormSubmit() {
  $('#articleForm').submit(function() {
    $('#js-article-content').val($('#editor').html());
  });
}

function slideToggle() {
  $(this).next("div").slideToggle("slow").siblings(".left-sidebar-detail:visible").slideUp("slow");
}

function reloadCaptcha() {
  var img = $('.rucaptcha-image')[0];
  img.src = img.src.split('?')[0] + '?' + (new Date()).getTime();
}

function swalAlert(title, type, ajaxType, url) {
  swal({
   title: title,
   type: type,
   showCancelButton: true,
   closeOnConfirm: false,
   confirmButtonText: "是的",
   confirmButtonColor: "#ec6c62"
   }, function() {
     $.ajax({
       url: url,
       type: ajaxType,
       dataType: 'script',
       success: function(){}
     })
   });
}

function deleteArticle() {
  var self = $(this);
  swalAlert("您确定要删除吗？", "warning", "DELETE", "/ajax/articles/"+ self.data('id'));
}

function deleteBattlePlane() {
  var self = $(this);
  swalAlert("您确定要删除吗？", "warning", "DELETE", "/ajax/battle_planes/"+ self.parent().data('id'));
}

function deleteGallery() {
  var self = $(this);
  swalAlert("您确定要删除吗？", "warning", "DELETE", "/ajax/pictures/"+ self.data('id'));
}

function editVideo() {
  window.location.href = '/admin/videos/'+$(this).parent().data('id')+'/edit';
}

function deleteVideo() {
  var self = $(this);
  swalAlert("您确定要删除吗？", "warning", "DELETE", "/ajax/videos/"+ self.parent().data('id'));
}

function deleteComment() {
  var self = $(this);
  swalAlert("您确定要删除吗？", "warning", "DELETE", "/ajax/comments/"+ self.data('id'));
}

function setHomepage() {
  swalAlert("设置为今日视频？", "warning", "PUT", "/ajax/videos/"+ $(this).parent().data('id'));
}
