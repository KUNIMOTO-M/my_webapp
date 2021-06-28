import Vue from 'vue';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import '@mdi/font/css/materialdesignicons.css';
import TurbolinksAdapter from 'vue-turbolinks';
import PageNation from '../PagenationMicropost.vue';
Vue.use(TurbolinksAdapter)

Vue.use(Vuetify); // 追加

document.addEventListener('turbolinks:load', () => {
  const microposts = new Vue({
    el: '#microposts',
    render: (h) => h(PageNation),
    vuetify: new Vuetify({
      icons: {
        iconfont: 'mdi', 
      },
    }),
  })
})
