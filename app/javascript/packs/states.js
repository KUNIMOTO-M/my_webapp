import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import '@mdi/font/css/materialdesignicons.css';
import TurbolinksAdapter from 'vue-turbolinks';
import Reason from '../ReasonsState.vue';

Vue.use(TurbolinksAdapter)

Vue.use(Vuetify);

document.addEventListener('turbolinks:load', () => {
  const states = new Vue({
    el: '#states',
    render: (h) => h(Reason),
    vuetify: new Vuetify({
      icons: {
        iconfont: 'mdi', 
      },
    }),
  })
})