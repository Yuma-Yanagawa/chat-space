$(function() {
  function buildHTML(message){
    var html = `<div class="main__chat__messages__body__header">
                  <div class="main__chat__messages__body-user-name">
                  ${message.user_name}
                  </div>
                  <div class="main__chat__messages__body-date">
                  ${message.day}
                  </div>
                  <p class="main__chat__messages__body-content">
                    ${message.text}
                    </p>
                    </div>`
    return html;
  }

  function flash() {
  var html =
    `<p class="alert-notice">メッセージを送信しました</p>`
  $('.alert').append(html);
  $('.alert-notice').fadeIn(500).fadeOut(2000); //指定したクラスを0.5秒でfade inさせて、2秒でfade outさせる。
  setTimeout(function(){
   $('.alert-notice').remove();
  },2500); //指定のクラス自体をremoveする。
}

  function bottomScroll() {
      $('.main__chat__messages__body__header').scrollTop( $('.main__chat__messages__body-content').height());
    }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url =$(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data)
      console.log(html);
      $('.main__chat__messages__body').append(html);
      $('.footer__chat__form__js-form__message').val('');
      bottomScroll();
    })
    .fail(function(){
     alert('メッセージを入力してください');
   });
  });
});
