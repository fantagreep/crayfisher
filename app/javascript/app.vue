<template>
  <div>
    <header-component />
    <v-main>
      <router-view />
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
  components: {
    HeaderComponent,
    FooterComponent,
  },
}
</script>