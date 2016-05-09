$(function() {
  $('.my-comment p, .comment-content').each(parseEmoji);
  $(document).on('click', 'a.face', showEmoji);
  $(document).on('click', '.SmohanFaceBox h3 a.close', closeEmoji);
  $(document).on('mouseleave', '.SmohanFaceBox', closeEmoji);
  $(document).on('click', '.SmohanFaceBox li img', insertEmoji);
});

function parseEmoji() {
  var html = $(this).html();
  $(this).html(html.replace(/&lt;emt&gt;(\d{1,2})&lt;\/emt&gt;/g, '<img src="/images/emoji/$1.gif">'));
}

function showEmoji() {
  var emoji = '';
  for(i=1; i<=60; i++)
      emoji += '<li><a href="javascript:void(0)"><img src="/images/emoji/'+i+'.gif" data-face="<emt>'+i+'</emt>"/></a></li>';
  $(this).parents('.common-box').prepend("<div class='SmohanFaceBox'><span class='Corner'></span><div class='Content'><h3><span>常用表情</span><a class='close' title='关闭'></a></h3><ul>"+emoji+"</ul></div></div>")
}

function closeEmoji() {
  $(this).parents('.common-box').children('div:first').remove();
}

function insertEmoji() {
  $(this).parents('.common-box').find('textarea').insertContent($(this).data("face"));
}
