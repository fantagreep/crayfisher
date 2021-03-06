<template>
  <div>
    <footer class="footer">
      <nav>
        <ul>
          <li>
            <router-link to="/">
              Home
            </router-link>
          </li>
          <li>
            <router-link to="/">
              利用規約
            </router-link>
          </li>
          <li>
            <router-link to="/">
              プライバシーポリシー
            </router-link>
          </li>
        </ul>
      </nav>
    </footer>
    <footer class="bg-light text-center text-lg-start copyright">
      <div class="text-center p-3" style="background-color: #161D6F">
          © 2021 Copyright:
          <router-link to="/" class="footer-link">
            Crayfisher.com
          </router-link>
      </div>
    </footer>
  </div>
</template>