<template>
<v-app id="microposts">
<div class="microposts">
    <div class="title_container"> 
      <h1 class="content">マイクロポスト</h1>
      <v-btn  v-on:click="toggleMicropostModal()" depressed style="margin-top:15px; margin-left:50px">
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
    </div> 

    <v-dialog v-model="dialogPostFlag" width="800" persistent> <!-- 説明 3.18 -->
            <v-card>
              <v-card-title class="headline primary lighten-3 white--text" primary-title>
                Create Micropost
              </v-card-title>
      <v-card-text>
        <div style='width:100%;'>
          <textarea style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='micropostContent' placeholder="Tell everyone more about you!"></textarea> <!-- 説明 3.19 -->
        </div>
      </v-card-text>
      <v-divider></v-divider>

      <v-card-actions>
        <v-btn color="#grey lighten-4" text v-on:click="toggleMicropostModal">
          Cancel
        </v-btn>
        <v-spacer></v-spacer>
        <v-btn color="red" text v-on:click="postMicropost">
          Add Micropost
        </v-btn>
      </v-card-actions>
            </v-card>
      </v-dialog>

    <div v-if="items.length" class="notice_container">
       <div style="text-align:center;">
    </div>
          <div class="notice_container_item" v-for="item in getItems" :key="item.id">
            <div class="notice_container_item2">
              <div class="notice_container_item_image">
              <a v-bind:href="'users/' + item.user_id + '/show_notice' ">
                <div class="user_image">                                                        
                    <img class="image" v-if="item.image" v-bind:src="item.image" >
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
                <div id="like">

          <like :user-id="item.user_id" :micropost-id="item.id"></like>
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
</div>
</v-app>
</template>
<script>
import Vue from 'vue/dist/vue.esm';
import Paginate from 'vuejs-paginate'
import axios from 'axios';
import Like from 'LikeButton.vue';
Vue.component('paginate', Paginate);
import moment from 'moment';

 export default {
   components: {
      'like': Like
   },
    filters: {
      moment: function (date) {
          return moment(date).fromNow();
      }
  },
   data: function() {
     return {
     items: [],
     parPage: 40,
     currentPage: 1,
     dialogPostFlag: false,
     micropostContent: "",
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
    toggleMicropostModal: function() {
        console.log('aaa');
        this.dialogPostFlag = !this.dialogPostFlag
      },
      postMicropost: function() {
        axios.post('/microposts', {content: this.micropostContent})
          .then(response => {
            this.micropostContent = ''
            this.noticesList(); 
          }
        );
        this.dialogPostFlag = !this.dialogPostFlag
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