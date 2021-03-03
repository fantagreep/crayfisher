<template>
  <div>
    <div class="map-wrapper" data-turbolinks='false'>
      <div id="map" class="gmap"></div>
    </div>
    <div class="row">
      - if user_signed_in?
        <aside class="col-md-4">
          <section class="post_form">
            = render 'shared/post_form'
          </section>
          <button data-toggle="modal" data-target="#ModalHowTo" class="btn btn-link pull-right" id="modal-how-to">投稿方法についてはこちら</button>
        </aside>
      - else
        <aside class="col-md-4"></aside>
          <div class="center jumbotron">
            <h2>Crayfisherへようこそ！</h2>
            <h4>Crayfisherは子供の遊び場スポットを共有するサービスです。
              <br>今すぐCrayfisherに登録して、全国のお父さんお母さんたちと遊び場スポットを共有しましょう！
            </h4>
            = link_to "今すぐ登録する！", new_user_registration_path, class: "btn btn-lg btn-info"
            <br>
            = link_to "Crayfisherとは?", about_path, class: "btn btn-link"
          </div>
      <div class="feed col-md-8">
        <h3 id="feed-header">最近の投稿</h3>
        = render 'shared/feed', user: @user
        <div class="posts">
          - @spots.each do |spot|
            = render '/posts/modal', post: spot.post, comment: @comment
        </div>
      </div>
    </div>
    = render '/static_pages/howto'
  </div>
</template>