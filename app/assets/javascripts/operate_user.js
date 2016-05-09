$(function() {
  $(document).on('click', '.js-toggle', toggle);
  $(document).on('click', '.js-release', release);
  $(document).on('click', '#js-limit', limit);
});

function toggle() {
  var td = $(this).parent();
  var username = td.siblings().eq(1).html();
  var title = "您确定将"+ username + $(this).html() + "吗?"
  swal({
   title: title,
   type: "warning",
   showCancelButton: true,
   closeOnConfirm: false,
   confirmButtonText: "是的",
   confirmButtonColor: "#ec6c62"
   }, function() {
     $.ajax({
       url: "/ajax/users/"+ td.parent().data('id'),
       type: "PUT",
       dataType: 'script',
       success: function(){}
     })
   });
}

function release() {
  var td = $(this).parent();
  var username = td.siblings().eq(1).html();
  swal({
   title: "您确定解封"+ username +"吗？",
   type: "warning",
   showCancelButton: true,
   closeOnConfirm: false,
   confirmButtonText: "是的",
   confirmButtonColor: "#ec6c62"
   }, function() {
     $.ajax({
       url: "/ajax/users/"+ td.parent().data('id') + "/release",
       type: "PUT",
       dataType: 'script',
       success: function(){}
     })
   });
}

function limit() {
  $('#limitForm').attr('action', '/ajax/users/'+$('#user-id').val()+'/limit').submit();
}
