import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

new Vue({
  el: '.js-post',
  data: {
    postInfo: {},
    postInfoBool: false
  },
  methods: {
    setPostInfo(id){
      axios.get(`api/posts/${id}.json`).then(res => {
        this.postInfo = res.data;
        this.postInfoBool = true;
      });
    }
  }
});
