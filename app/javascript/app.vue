<template>
  <div>
    <div class="menu">
        <div class="menu_inner">
          <div class="hrader_logo">
            <h1 class="logo logo">
            </h1>
          </div>
          <ul class="menu_list" >
            <li><router-link to="/">ホーム</router-link></li>
            <li><router-link to="#">検索</router-link></li>
            <router-link to="/api/v1/notices">掲示板</router-link>
            <li><router-link to="#">メッセージ</router-link></li>
            <li><router-link to="#">プロフィール</router-link></li>
            <li><router-link to="#">ログアウト</router-link></li>
            <li><router-link to="#">設定</router-link></li>
          </ul> 
        </div>
      </div>
    <div class="main_container">
    <router-view></router-view>
    </div>
  </div>
</template>

<script>
import router from 'route.js'

export default {
  router
}
</script>

<style scoped>
</style>