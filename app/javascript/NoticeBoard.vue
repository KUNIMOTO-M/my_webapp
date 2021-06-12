<template>
<div id="app">
  <div class="posts-c">
    <div class="title_container"> 
      <h1 class="content">掲示板</h1>
    </div>

  <div class="posts-c-one">
  <div class="card-group">
    <div v-for="notice in notices" :key="notice.id">
          <div class="card ">
          <div class="profile_image_area">
            <div class="user_image2">
                <img src="/assets/default.png" class="image2" alt="ユーザーアイコン" >
              </div>
          </div>
            <div class="card-body">
              <h4 class="card-title">{{ notice.name }}</h4>
              <p class="card-text">{{ notice.notice_title }}</p>
                詳細
            </div>
            </div>
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
      notices: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/notices.json')
      .then(response => (this.notices = response.data))
  }
}
</script>
