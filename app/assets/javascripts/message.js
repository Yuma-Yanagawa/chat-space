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
                  ${if(message.body && message.image)}
                    ${message.text}
                    </p>
                    </div>`
    return html;
  }

  function flashMessage() {
  var html =
    `<p class="header__flashmessage">メッセージを送信しました</p>`
  $('.flash__message').append(html);
  $('.header__flashmessage').fadeIn(2000).fadeOut(1000); //指定したクラスを0.5秒でfade inさせて、2秒でfade outさせる。
  setTimeout(function(){
   $('.header__flashmessage').remove();
  },2500); //指定のクラス自体をremoveする。
}

  function bottomScroll() {
    $('.main__chat').animate({scrollTop: $('.main__chat')[0].scrollHeight},  'fast');
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
      $('.main__chat__messages__body-list').append(html);
      $('.footer__chat__form__js-form__message').val('');
      $(".footer__chat__form__js-form__mask__image__submit").prop('disabled', false);
      flashMessage();
      bottomScroll();
    })
    .fail(function(){
     alert('メッセージを入力してください');
   });
  });
});
