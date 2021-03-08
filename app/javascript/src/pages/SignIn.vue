<template>
  <div>
    <h2>ログイン</h2>
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <form class="new_user" id="new_user" action="/users/sign_in" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="ZLXzloFYERxYkzpR9UTyGx0isYZ5eewXse9/ASlmBVUtLZ9/6jJ04t9VLBdW9Yx14o0xL7YRWEVj9W7a+v5b+A==">
          <div class="field">
            <label for="user_email">
              メールアドレス  (テストユーザーの方は「example@example.com」をご利用ください)
            </label>
            <br>
            <input autofocus="autofocus" autocomplete="email" type="email" name="user[email]" id="user_email">
          </div>
          <div class="field">
            <label for="user_password">
              パスワード  (テストユーザーの方は「foobar」をご利用ください)
            </label>
            <br>
            <input autocomplete="current-password" type="password" name="user[password]" id="user_password">
          </div>
          <div class="field">
            <label class="checkbox inline" for="user_remember_me">
              <input name="user[remember_me]" type="hidden" value="0">
              <input id="session_remember_me" type="checkbox" value="1" name="user[remember_me]">
              <span>ログイン状態を保持する</span>
            </label>
          </div>
          <div class="actions">
            <input type="submit" name="commit" value="ログイン" class="blue btn white" data-disable-with="ログイン">
          </div>
        </form>
        <div class="center">
          <router-link to="/signup">
            <h2 class="btn">新規登録はこちら</h2>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>