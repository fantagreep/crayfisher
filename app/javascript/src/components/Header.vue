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
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link to="/">
            <span class="nav-link">Home</span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/about">
            <span class="nav-link">Crayfisherとは？</span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/signin">
            <span class="nav-link">ログイン</span>
          </router-link>
        </li>
        <li class="nav-item">
          <router-link to="/signup">
            <span class="nav-link">新規登録</span>
          </router-link>
        </li>
      </ul>
    </div>
    <NoticeFeed v-if="currentUser"/>
  </v-app-bar>
</template>
