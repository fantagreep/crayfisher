import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from './src/pages/Home.vue';
import About from './src/pages/About.vue';
import SignIn from './src/pages/SignIn.vue';
import SignUp from './src/pages/SignUp.vue';

const routes = [
  {path: '/', component: Home},
  {path: '/about', component: About},
  {path: '/signup', component: SignUp},
  {path: '/signin', component: SignIn}
];

export default new VueRouter({ 
  mode: 'history',
  routes
});