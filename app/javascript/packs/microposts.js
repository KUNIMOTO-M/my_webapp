import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import axios from 'axios';
import '@mdi/font/css/materialdesignicons.css';
import TurbolinksAdapter from 'vue-turbolinks';
import PageNation from '../PagenationMicropost.vue';
Vue.use(TurbolinksAdapter)

Vue.use(Vuetify); // 追加

document.addEventListener('turbolinks:load', () => {
  const microposts = new Vue({
    el: '#microposts',
    components: { PageNation },
    vuetify: new Vuetify({
      icons: {
        iconfont: 'mdi', 
      },
    }),
    data: function () {
      return {
          message: "Hello vue",
          items: [],
          dialogPostFlag: false,
          micropostContent: '',
      }
    },
    methods: {
      micropostsList: function() {
        axios.get('/microposts.json')
        .then(response => {
          this.items = response.data
        }
        )
      },
      toggleMicropostModal: function() {
        this.dialogPostFlag = !this.dialogPostFlag
      },
      postMicropost: function() {
        axios.post('/microposts', {content: this.micropostContent})
          .then(response => {
           // 説明 3.21
            this.micropostContent = ''
            window.location.href = '/microposts';
          }
        );
      
        this.dialogPostFlag = !this.dialogPostFlag // 説明 3.22
      },
    },
  })
})
