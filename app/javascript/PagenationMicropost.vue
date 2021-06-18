<template>

    <div v-if="items.length" class="notice_container">
       <div style="text-align:center;">
    </div>
          <div class="notice_container_item" v-for="item in getItems" :key="item.id">
            <div class="notice_container_item2">
              <div class="notice_container_item_image">
              <a v-bind:href="'users/' + item.user_id + '/show_notice' ">
                <div class="user_image">                                                        
                    <img class="image" v-if="item.image" v-bind:src="'uploads/' + item.image" >
                    <img src="/assets/default.png" v-else class="image" alt="ユーザーアイコン" >
                </div>
              </a>
              </div>
              <div class="microposts_contents">
                <div class="microposts_info">
                  <div class="microposts_info_user">
                    <div class="micropost_user">
                      {{item.name}}
                    </div>
                    <div class="micropost_time">
                        Posted {{item.created_at | moment}} 
                    </div>
                  </div>
                  <div class="microposts_delete">
              
                  </div>
                </div>
                <div class="micropost_content">
                  {{ item.content}}
                </div>
              </div>
          </div>
          </div>
    <div style="text-align:center;">
    <paginate
    :page-count="getPageCount"
    :page-range="3"
    :margin-pages="2"
    :click-handler="clickCallback"
    :prev-text="'＜'"
    :next-text="'＞'"
    :container-class="'pagination'"
    :page-class="'page-item'"
   >
    </paginate>
    </div>
    </div>

</template>
<script>
import Vue from 'vue/dist/vue.esm';
import Paginate from 'vuejs-paginate'
import axios from 'axios';
Vue.component('paginate', Paginate);
import moment from 'moment';

 export default {
    filters: {
      moment: function (date) {
          return moment(date).fromNow();
      }
  },
   data: function() {
     return {
     items: [],
     parPage: 40,
     currentPage: 1
   }},
   methods: {
    clickCallback: function (pageNum) {
      this.currentPage = Number(pageNum);
      this.returnTop();
    },
    noticesList: function() {
      axios.get('/microposts.json')
      .then(response => {
        this.items = response.data
      }
      )
    },
    returnTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }
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