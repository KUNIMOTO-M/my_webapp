<template>
 <div class="posts-c-one">
  <div class="card-group" v-if="items.length">
    <div class="card" v-for="item in getItems" :key="item.id">
    <div class="profile_image_area">
      <div class="user_image2">
        <img class="image" v-if="item.image" v-bind:src="'uploads/' + item.image" >
        <img src="/assets/default.png" v-else class="image" alt="ユーザーアイコン" >
        </div>
    </div>
      <div class="card-body">
        <h4 class="card-title"><strong>{{item.name}}</strong></h4>
        <p class="card-text" style="color:blue;">Area {{item.area }}</p>  
        <p class="card-text">{{item.notice_title }}</p>    
        <a v-bind:href="'notices/' + item.id ">
          <v-btn color="primary">
            <v-icon>more</v-icon>
          </v-btn>
        </a>
      </div>
    </div>
    <div style="margin:0 auto;">
    <paginate
    :page-count="getPageCount"
    :page-range="3"
    :margin-pages="2"
    :click-handler="clickCallback"
    :prev-text="'＜'"
    :next-text="'＞'"
    :container-class="'pagination'"
    :page-class="'page-item'">
    </paginate>
    </div>
      </div>
  </div>

</template>
<script>
import Vue from 'vue/dist/vue.esm';
import Paginate from 'vuejs-paginate'
import axios from 'axios';
Vue.component('paginate', Paginate)

 export default {
   data: function() {
     return {
     items: [],
     parPage: 6,
     currentPage: 1
   }},
   methods: {
    clickCallback: function (pageNum) {
      this.currentPage = Number(pageNum);
    },
    noticesList: function() {
      axios.get('/notices.json')
      .then(response => {
        this.items = response.data
      }
      )
    },
    
    },
    created () {
      this.noticesList();
    },
   computed: {
     getItems: function() {
       let current = this.currentPage * this.parPage;
       let start = current - this.parPage;
       return this.items.slice(start, current);
     },
     getPageCount: function() {
       return Math.ceil(this.items.length / this.parPage);
     }
   }
 }
</script>