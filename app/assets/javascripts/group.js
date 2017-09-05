$(function() {
function appendUser(user){
  var html = `<li class="chat-group-user">
                <div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>
              </li>`;
  $("#user-search-result").append(html);
}

function appendNoUser(user) {
    var html = `<li class="chat-group-user">
                  <div class='listview__element--right-icon'>${ user }</div>
                </li>`;
    $("#user-search-result").append(html);
  }

  function buildMember(id, name) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`;
    return html;
  }

  $(".chat-group-form__input").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(data) {
      if (data.length !== 0) {
        $("li").remove();
        data.forEach(function(user){
         appendUser(user);
       });
     }
     else {
       $("li").remove();
       appendNoUser("一致するユーザーはいません");
     }
   })
   .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });
  $(".chat-group-form").on('click', ".user-search-add", function() {
      var id = $(this).data("user-id");
      var name = $(this).data("user-name");
      var html = buildMember(id, name);
      $('#chat-group-users').append(html);
      var user = $(this).parent();
      user.remove();
  });
  $(".chat-group-form").on('click', ".user-search-remove", function() {
      var user = $(this).parent();
      user.remove();
  });
});
