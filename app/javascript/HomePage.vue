<template>
  <div id="app">
    <div class="microposts">
      <div class="title_container"> 
        <h1 class="content">マイクロポスト</h1>
      </div> 

    <div class="notice_container">
      <div v-for="micropost in microposts" :key="micropost.id">
          <div class="notice_container_item">
            <div class="notice_container_item2">
              <div class="notice_container_item_image">
                <div class="user_image">
                  <img src="/assets/default.png" class="image" alt="ユーザーアイコン" >
                </div>
              </div>
              <div class="microposts_contents">
                <div class="microposts_info">
                  <div class="microposts_info_user">
                    <div class="micropost_user">
                      {{ micropost.name }}
                    </div>
                    <div class="micropost_time">
                      posted {{ micropost.created_at}}agp.
                    </div>
                  </div>
                  <div class="microposts_delete">
                  </div>
                </div>
                <div class="micropost_content">
                  {{ micropost.content }}
                </div>
              </div>
          </div>
          </div>
        <div class="pagenate_tag">
        </div>
        </div>
    </div>
  </div>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      microposts: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/home.json')
      .then(response => (this.microposts = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>