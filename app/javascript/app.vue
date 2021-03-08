<template>
  <div>
    <header-component />
    <v-main>
      <router-view />
      <p>{{ message }}</p>
    </v-main>
    <v-footer>
      <footer-component />
    </v-footer>
  </div>
</template>
<script>
import HeaderComponent from './src/components/Header';
import FooterComponent from './src/components/Footer';
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: {
    HeaderComponent,
    FooterComponent,
  },
}
</script>