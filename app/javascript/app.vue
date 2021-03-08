<template>
  <div>
    <header-component />
    <v-main>
      <router-view />
      {{ posts }}
    </v-main>
    <v-footer>
      <footer-component />
    </v-footer>
  </div>
</template>

<script>
import HeaderComponent from './src/components/Header';
import FooterComponent from './src/components/Footer';
import axios from 'axios';

export default {
  data: function () {
    return {
      posts: []
    }
  },
  mounted() {
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts = response.data))
  },
  components: {
    HeaderComponent,
    FooterComponent,
  },
}
</script>