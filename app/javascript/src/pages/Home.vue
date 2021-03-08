<template>
  <div id="home-page">
    <div class="map-wrapper" data-turbolinks='false'>
      <div id="map" class="gmap"></div>
    </div>
    <div class="row">
      <aside class="col-md-4" v-if="signedIn">
        <section class="post_form">
          = render 'shared/post_form'
        </section>
        <button data-toggle="modal" data-target="#ModalHowTo" class="btn btn-link pull-right" id="modal-how-to">投稿方法についてはこちら</button>
      </aside>
      <aside class="col-md-4" v-if="!signedIn">
        <div class="center jumbotron">
          <h2>Crayfisherへようこそ！</h2>
          <h4>Crayfisherは子供の遊び場スポットを共有するサービスです。
            <br>今すぐCrayfisherに登録して、全国のお父さんお母さんたちと遊び場スポットを共有しましょう！
          </h4>
          <router-link to="/signup">
            <h2 class="btn btn-lg btn-info">今すぐ登録する！</h2>
          </router-link>
          <br>
          <router-link to="/about">
            <h2 class="btn btn-link">Crayfisherとは？</h2>
          </router-link>
        </div>
      </aside>
      <div class="feed col-md-8">
        <h3 id="feed-header">最近の投稿</h3>
        = render 'shared/feed', user: @user
        <div class="posts">
          {{ allPosts }}
        </div>
      </div>
    </div>
    = render '/static_pages/howto'
  </div>
</template>

<!--
<script>
  import Vue from 'vue';
  import axios from 'axios';

  new Vue({
    el: '#home-page',
    data: {
      allPosts: {},
    },
    methods: {
      setAllPosts(id){
        axios.get(`/api.json`)
          .then(res => {
            this.allPosts = res.data;
          });
      }
    }
  });
</script>
-->
