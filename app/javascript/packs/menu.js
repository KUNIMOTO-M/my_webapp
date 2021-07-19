import Vue from 'vue';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css"; 
import '@mdi/font/css/materialdesignicons.css';
import TurbolinksAdapter from 'vue-turbolinks';
import Menu from '../Menu.vue';
Vue.use(TurbolinksAdapter)

Vue.use(Vuetify); // 追加

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#menu',
    render: h => h(Menu, { props: document.getElementById("menu").dataset})
  })
})
