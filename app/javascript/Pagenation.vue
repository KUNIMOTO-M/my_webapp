<template>
<v-app id="notices">
<div>
<div class="posts-c">
  <div class="title_container"> 
    <h1 class="content">掲示板</h1>
    <v-btn  v-on:click="toggleNoticeModal()" depressed style="margin-top:15px; margin-left:50px">
      <v-icon>mdi-pencil</v-icon>
    </v-btn>
  </div> 


 <div class="posts-c-one">
  <div class="card-group" v-if="items.length">
    <div class="card" v-for="item in getItems" :key="item.id">
    <div class="profile_image_area">
      <div class="user_image2">
        <img class="image" v-if="item.image" v-bind:src="item.image" >
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

</div>
  <v-dialog v-model="dialogPostFlag" width="800" transition="dialog-bottom-transition"
        max-width="600"> <!-- 説明 3.18 -->
    <v-card>
      <v-card-title class="headline red lighten-3 white--text" primary-title>
        Create Notice
      </v-card-title>
      <v-text-field v-model="noticeTitle" label="タイトル" required style='margin:20px; margin-top:30px'></v-text-field>
      <v-select
          v-model="noticeArea"
          item-text="label"
          item-value="value"
          :items="areas"
          label="募集エリア"
          return-object
          required style='margin:20px; margin-top:30px'
        ></v-select>
      <v-card-text>
        <p>募集内容</p>
        <div style='width:100%;'>
          <textarea style='width:100%; height:300px; background-color:#efefef; padding:3px' v-model='noticeContent'></textarea> <!-- 説明 3.19 -->
        </div>
      </v-card-text>
      <v-divider></v-divider>

      <v-card-actions>
        <v-btn color="#grey lighten-4" text v-on:click="toggleNoticeModal">
          Cancel
        </v-btn>
        <v-spacer></v-spacer>
        <v-btn color="red" text v-on:click="postNotice">
          Add Notice
        </v-btn>
      </v-card-actions>
    
    </v-card>
  </v-dialog>

</div>
</v-app>
</template>
<script>
import Vue from 'vue';
import Paginate from 'vuejs-paginate'
import axios from 'axios';
Vue.component('paginate', Paginate)
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
      parPage: 6,
      currentPage: 1,
      dialogPostFlag: false,
      noticeTitle: "",
      noticeContent: "",
      noticeArea:{ label: "オンライン", value: 0},
      areas: [
      {label: 'オンライン',value: 0},
      {label: '北海道',value: 1},
      {label: '青森県',value: 2},
      {label: '岩手県',value: 3},
      {label: '宮城県',value: 4},
      {label: '秋田県',value: 5},
      {label: '山形県',value: 6},
      {label: '福島県',value: 7},
      {label: '茨城県',value: 8},
      {label: '栃木県',value: 9},
      {label: '群馬県',value: 10},
      {label: '埼玉県',value: 11},
      {label: '千葉県',value: 12},
      {label: '東京都',value: 13},
      {label: '神奈川県',value: 14},
      {label: '新潟県',value: 15},
      {label: '富山県',value: 16},
      {label: '石川県',value: 17},
      {label: '福井県',value: 18},
      {label: '山梨県',value: 19},
      {label: '長野県',value: 20},
      {label: '岐阜県',value: 21},
      {label: '静岡県',value: 22},
      {label: '愛知県',value: 23},
      {label: '三重県',value: 24},
      {label: '滋賀県',value: 25},
      {label: '京都府',value: 26},
      {label: '大阪府',value: 27},
      {label: '兵庫県',value: 28},
      {label: '奈良県',value: 29},
      {label: '和歌山県',value: 30},
      {label: '鳥取県',value: 31},
      {label: '島根県',value: 32},
      {label: '岡山県',value: 33},
      {label: '広島県',value: 34},
      {label: '山口県',value: 35},
      {label: '徳島県',value: 36},
      {label: '香川県',value: 37},
      {label: '愛媛県',value: 38},
      {label: '高知県',value: 39},
      {label: '福岡県',value: 40},
      {label: '佐賀県',value: 41},
      {label: '長崎県',value: 42},
      {label: '熊本県',value: 43},
      {label: '大分県',value: 44},
      {label: '宮崎県',value: 45},
      {label: '鹿児島県',value: 46},
      {label: '沖縄県',value: 47},
      ]
    }
    },
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
    toggleNoticeModal: function() {
        this.dialogPostFlag = !this.dialogPostFlag
      },
    postNotice: function() {
      axios.post('/notices', {notice_title: this.noticeTitle, notice_body: this.noticeContent, are: this.noticeArea})
        .then(response => {
        this.noticeTitle = "",
        this.noticeContent = "",
        this.noticeArea = ""
        this.noticesList(); 
      }
    );
    this.dialogPostFlag = !this.dialogPostFlag
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