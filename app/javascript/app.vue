<template>
  <div>
    <header-component />  // ヘッダーコンポーネント   
    <v-main>
      <router-view /> // routes.jsに設定したコンポーネントが描画される
    </v-main>
    <v-footer>
      <footer-component />　// フッターコンポーネント
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