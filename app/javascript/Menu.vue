<template>
      <div class="menu">
        <div class="menu_inner">
          <div class="hrader_logo">
            <h1 class="logo logo">
            </h1>
          </div>
          <ul class="menu_list" >
            <li class="menu_list_li" data-turbolinks="false"><a href="/microposts" class="menu_list_item">ホーム</a></li>
            <li class="menu_list_li" data-turbolinks="false"><a href="/notices" class="menu_list_item">掲示板</a></li>
            <li class="menu_list_li" ><a href="/rooms" class="menu_list_item">メッセージ</a></li>
            <li class="menu_list_li" data-turbolinks="false"><a v-bind:href="'users/' + userId + '/show_notice'">プロフィール</a></li>
            <li class="menu_list_li"><a href="/notices/search" class="menu_list_item">検索</a></li>
            <li class="menu_list_li"><a href="//users/edit" class="menu_list_item">設定/a></li>
            <li class="menu_list_li"><a href="/users/sign_out" class="menu_list_item">ログアウト</a></li>
          </ul> 
        </div>
      </div>
</template>
<script>
export default {
  props: ['userId'],
  created() {
    let userId = this.userId;
  }
  }
</script>