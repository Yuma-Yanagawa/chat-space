$(function() {
  function buildHTML(message){
    var html = `<div class="main__chat__messages__body-user-name">
                 ${message.user.name}
                </div>
                <div class="main__chat__messages__body-date">
                ${message.created_at.strftime("%Y/%m/%d %H:%M")}
                </div>
                <p class="main__chat__messages__body-content">
                ${message.image.to_s}
                ${message.body}
                </p>
                </div>`
  }
  function bottomScroll() {
      $('.main__chat__messages__body').scrollTop( $('.main__chat__messages__body-content').height());
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
      var html = buildHTML(data){
        $('.main__chat__messages__body-content').append(html)
        $('.footer__chat__form__js-form__message').val('')
      }
    })
    .fail(function(){
     alert('メッセージを入力してください');
   })
  });
});
