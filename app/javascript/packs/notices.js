import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css";
import axios from 'axios';
import '@mdi/font/css/materialdesignicons.css'

Vue.use(Vuetify);

document.addEventListener('DOMContentLoaded', () => {
  const notices = new Vue({
    el: '#notices',
    vuetify: new Vuetify({
      icons: {
        iconfont: 'mdi', 
      },
    }),
    data: function () {
      return {
        message: "Hello Vue",
        notices: [""],
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
      noticesList: function() {
        axios.get('/notices.json')
        .then(response => {
          this.notices = response.data
        }
        )
      },
      toggleNoticeModal: function() {
        this.dialogPostFlag = !this.dialogPostFlag
      },
      postNotice: function() {
        axios.post('/notices', {notice_title: this.noticeTitle, notice_body: this.noticeContent, area: this.noticeArea.value})
        .then(response => {
          this.noticesList();
          this.noticeTitle = "",
          this.noticeContent = "",
          this.noticeArea = ""
          }
        )
          this.dialogPostFlag = !this.dialogPostFlag
      },
    },
    mounted () {
      this.noticesList();
    }
  })
})