import Vue from "vue";
import VueRouter from 'vue-router';
import HomePage from 'HomePage.vue';
import NoticeBoard from 'NoticeBoard.vue'

Vue.use(VueRouter);

const routes = [
  { path: '/', component: HomePage, },
  { path: '/api/v1/notices', component: NoticeBoard,}
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router;