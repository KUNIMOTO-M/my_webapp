<template>
  <div>
    <div v-if="isLiked" @click="deleteLike()">
       <v-btn
        text
        icon
        color="blue lighten-2"
      >
        <v-icon>mdi-thumb-up</v-icon>
      </v-btn> {{ count }}
    </div>
    <div v-else @click="registerLike()">
            <v-btn
        text
        icon
        color="gray lighten-2"
      >
        <v-icon>mdi-thumb-up</v-icon>
      </v-btn> {{ count }}
    </div>
  </div>
</template>

<script>
// axios と rails-ujsのメソッドインポート
import axios from 'axios'

export default {
  // propsでrailsのviewからデータを受け取る
  props: ['micropostId'],
  data() {
    return {
      likeList: [],
      userId: null  // いいね一覧を格納するための変数　{ id: 1, user_id: 1, post_id: 1 } がArrayで入る
    }
  },
  // 算出プロパティ ここではlikeListが変更される度に、count、isLiked が再構築される (watchで監視するようにしても良いかも)
  computed: {
    // いいね数を返す
    count() {
      return this.likeList.length
    },
    // ログインユーザが既にいいねしているかを判定する
    isLiked() {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    this.fetchLikeByPostId().then(result => {
      this.likeList = result
    })
        axios.get('/like/userid')
    .then(response => {
      this.userId = response.data
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchLikeByPostId: async function() {
      const res = await axios.get(`/like/?micropost_id=${this.micropostId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerLike: async function() {
      const res = await axios.post('/like', { micropost_id: this.micropostId })
      if (res.status !== 201) { process.exit() }
      this.fetchLikeByPostId().then(result => {
        this.likeList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteLike: async function() {
      const likeId = this.findLikeId()
      const res = await axios.delete(`/like/${likeId}`)
      if (res.status !== 200) { process.exit() }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
    findLikeId: function() {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.userId)
      })
      if (like) { return like.id }
    }
  }
}
</script>