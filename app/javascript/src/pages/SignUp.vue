<template>
  <div>
    <h2>新規登録</h2>
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <form class="new_user" id="new_user" enctype="multipart/form-data" action="/users" accept-charset="UTF-8" method="post">
          <input name="utf8" type="hidden" value="✓">
          <input type="hidden" name="authenticity_token" value="A0iISgv8VgZRAtSw/1hQWXscNSrqtflH/WmPiVTjWhxK0OSjYJYz+NbEwvZc6S43hLO1gyXdTRUvc55Sh3sEsQ==">
          <label for="user_name">名前</label>
          <input autofocus="autofocus" class="form-control" type="text" name="user[name]" id="user_name">
          <label for="user_email">メールアドレス</label>
          <input class="form-control" type="email" name="user[email]" id="user_email">
          <label for="user_image">プロフィール画像</label>
          <input type="file" name="user[image]" id="user_image">
          <label for="user_password">パスワード</label>
          <em>(6 文字以上で入力してください)</em>
          <input class="form-control" type="password" name="user[password]" id="user_password">
          <label for="user_password_confirmation">パスワード（確認）</label>
          <input class="form-control" type="password" name="user[password_confirmation]" id="user_password_confirmation">
          <input type="submit" name="commit" value="登録する" class="btn btn-primary blue" data-disable-with="登録する">
          <div class="policy-link">
            <router-link to="/terms">
              <span class="btn">利用規約</span>
            </router-link>
            <router-link to="/policy">
              <span class="btn">プライバシーポリシー</span>
            </router-link>
            <router-link to="/signin">
              <span class="btn">ログイン</span>
            </router-link>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>