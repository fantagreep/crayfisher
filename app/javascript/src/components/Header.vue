<template>
  <v-app-bar
    color="cyan" 
    dark 
    app 
    fixed
    class="navbar navbar-expand-lg navbar-light"
  >
    <v-toolbar-title>
      <router-link to="/">
        <h2 class="app-title navbar-brand" id="logo">Crayifisher</h2>
      </router-link>
    </v-toolbar-title>
    <v-spacer />
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <i class="fas fa-bars fa-lg hamburger"></i>
    </button>
    <div id="navbarSupportedContent" class="collapse navbar-collapse">
      <ul navbar-nav>
        <li class="nav-item">
          <router-link
            to="/about"
            text
            color="white"
            :outlined="true"
            small
          >
            <span class="nav-link">Crayfisherとは？</span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link
            to="/signin"
            text
            color="white"
            :outlined="true"
            small
          >
            <span class="nav-link">ログイン</span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link
            to="/signup"
            text
            color="white"
            :outlined="true"
            small
          >
            <span class="nav-link">新規登録</span>
          </router-link>
        </li>
      </ul>
    </div>
    <NoticeFeed v-if="currentUser"/>
    <v-menu
      v-model="value"
      :offset-y="true"
      :left="true"
      v-if="currentUser"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-avatar
          size="30"
          v-bind="attrs"
          v-on="on"
        >
          <img
            v-if="currentUser.avatar_url"
            :src="currentUser.avatar_url"
          >
          <img
            v-else
            src="~/assets/images/default_icon.jpeg"
          />
        </v-avatar>
      </template>
      <v-list
        :dense="true"
        width="200px"
      >
        <v-list-item
          v-for="(item, index) in items"
          :key="index"
          :to="item.to"
        >
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
        <v-list-item
          @click="logOut"
        >
          <v-list-item-title>ログアウト</v-list-item-title>
        </v-list-item>
        <v-divider/>
        <v-list-item>
          <v-switch
            v-model="admin"
            color="orange"
            inset
            @change="changeAdmin"
            :label="`God mode`"
          ></v-switch>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
export default {
  data () {
    return {
      links: [
        { label: 'Crayfisher', path: '/' },
        { label: 'About', path: '/about' }
      ]
    }
  },
}
</script>