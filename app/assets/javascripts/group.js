$(function() {
function appendUser(user){
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name${user.name}>追加</a>
                </div>`
  $("#chat-group-users").append(html);
}

function appendNoUser(user) {
    var html = `<li>
                  <div class='listview__element--right-icon'>${ user }</div>
                </li>`
    $("#chat-group-users").append(html);
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
        data.forEach(function(user){
         appendUser(user);
       });
     }
     else {
       appendNoUser("一致するユーザーはいません");
     }
   })
   .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });
});
