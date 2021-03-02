import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from './src/pages/Home.vue';
import About from './src/pages/About.vue';

const routes = [
  {path: '/', component: Home},
  {path: '/about', component: About}
];

export default new VueRouter({ 
  mode: 'history',
  routes
});