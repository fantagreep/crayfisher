import Vue from 'vue'; 
import VueRouter from 'vue-router';
import router from '../routes'; // routes.js読み込み
import App from '../App';
//vue-routerをインストール
Vue.use(VueRouter);
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#application',
    router,
    render: (h) => h(App)
  });
});