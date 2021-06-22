import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import '@mdi/font/css/materialdesignicons.css';
import TurbolinksAdapter from 'vue-turbolinks';
import Like from '../LikeButton.vue';
Vue.use(TurbolinksAdapter)

Vue.use(Vuetify); // 追加

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#like',
    components: { Like }
  })
})
