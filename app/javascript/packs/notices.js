import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css";
import '@mdi/font/css/materialdesignicons.css'
import TurbolinksAdapter from 'vue-turbolinks';
import PageNation from '../Pagenation.vue';


Vue.use(TurbolinksAdapter)

Vue.use(Vuetify);

document.addEventListener('turbolinks:load', () => {
  const notices = new Vue({
    el: '#notices',
    components: { PageNation },
    vuetify: new Vuetify({
      icons: {
        iconfont: 'mdi', 
      },
    }),
  })
})
