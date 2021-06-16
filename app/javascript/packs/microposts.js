import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import axios from 'axios';

Vue.use(Vuetify); // 追加

document.addEventListener('DOMContentLoaded', () => {
  const microposts = new Vue({
    el: '#microposts',
    vuetify: new Vuetify(),
    data: function () {
      return {
          message: "Hello vue",
          microposts: [""],
          dialogPostFlag: false,
          micropostContent: '',
      }
    },
    methods: {
      micropostsList: function() {
        axios.get('/microposts.json')
        .then(response => {
          this.microposts = response.data
        }
        )
      },
      toggleMicropostModal: function() {
        this.dialogPostFlag = !this.dialogPostFlag
      },
      postMicropost: function() {
        axios.post('/microposts', {content: this.micropostContent})
          .then(response => {
            this.micropostsList();  // 説明 3.21
            this.micropostContent = ''
          }
        );
      
        this.dialogPostFlag = !this.dialogPostFlag // 説明 3.22
      },
    },
    mounted () {
      this.micropostsList();
    }
  })
})
