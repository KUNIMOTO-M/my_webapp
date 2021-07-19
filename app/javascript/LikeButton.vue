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
import axios from 'axios'

export default {
  props: ['micropostId'],
  data() {
    return {
      likeList: [],
      userId: null 
    }
  },
  computed: {
    count() {
      return this.likeList.length
    },
    isLiked() {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }
  },
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
    fetchLikeByPostId: async function() {
      const res = await axios.get(`/like/?micropost_id=${this.micropostId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    registerLike: async function() {
      const res = await axios.post('/like', { micropost_id: this.micropostId })
      if (res.status !== 201) { process.exit() }
      this.fetchLikeByPostId().then(result => {
        this.likeList = result
      })
    },
    deleteLike: async function() {
      const likeId = this.findLikeId()
      const res = await axios.delete(`/like/${likeId}`)
      if (res.status !== 200) { process.exit() }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    findLikeId: function() {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.userId)
      })
      if (like) { return like.id }
    }
  }
}
</script>