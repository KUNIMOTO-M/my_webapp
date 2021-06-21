<template>
  <v-app id="states" class="v-states" >
  <div style="display:flex;">
    <div v-if="states.length">
      <a  v-for="state in states" :key="state.id">
        <v-chip
        class="ma-2"
        color="blue"
        label
        text-color="white"
      >
        <v-icon left>
          mdi-label
        </v-icon>
        {{state.reason}}
      </v-chip>
      </a>
    </div> 

    <div>
      <v-btn  v-on:click="statusBoard()" depressed style="margin-top:15px; margin-left:50px">
        <v-icon>mdi-card-plus</v-icon>
      </v-btn>
    </div>    
  </div>
    <v-dialog
        transition="dialog-top-transition"
        max-width="600"
        v-model="dialogPostFlag"
        persistent>
      <v-card>
        <v-toolbar color="primary" dark>
          Opening from the top
        </v-toolbar>
        <v-card-text>
          <div>status</div>
        </v-card-text>
        <v-card-actions>
          <div>
            <v-btn rounded class="v-btns" v-bind:class="{ active: statusA }" v-on:click="changeStatusA" text>
              見るだけ
            </v-btn>
            <v-btn  rounded class="v-btns" v-bind:class="{active: statusB}" v-on:click="changeStatusB" text>
              友達募集
            </v-btn>
            <v-btn rounded class="v-btns" v-bind:class="{active: statusC}" v-on:click="changeStatusC" text>
              メッセージOK
            </v-btn>
            <v-btn rounded class="v-btns" v-bind:class="{active: statusD}" v-on:click="changeStatusD" text>
              勉強会しましょう
            </v-btn>
              <v-btn rounded class="v-btns" v-bind:class="{active: statusE}" v-on:click="changeStatusE"  text>
              一緒に研究
            </v-btn>
              <v-btn rounded class="v-btns" v-bind:class="{active: statusF}" v-on:click="changeStatusF" text>
              情報共有
            </v-btn>
            <v-btn rounded class="v-btns" v-bind:class="{active: statusG}" v-on:click="changeStatusG" text>
              同分野の人募集
            </v-btn>
            <v-btn rounded class="v-btns" v-bind:class="{active: statusH}" v-on:click="changeStatusH" text>
              誰でも歓迎
            </v-btn>
          </div>
        </v-card-actions>
        <v-card-actions class="justify-end">
          <v-btn text v-on:click="closeModal">
            Close
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app>
</template>

<script>
import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

export default {
  data: function () {
    return {
      states:[],
      userId: null,
      dialogPostFlag: false,
      statusA: false,
      statusB: false,
      statusC: false,
      statusD: false,
      statusE: false,
      statusF: false,
      statusG: false,
      statusH: false,
    }
  },
  methods: {
      closeModal: function() {
        this.getStatus();
        this.toggleNoticeModal();
        console.log("aaa")
      },
      getStatus: function() {
        axios.get('/states/' + this.userId + '/index')
        .then(response => {
        this.states = response.data
        })
      },
      getId: function() {
        var id = location.href.match(/[0-9]+/)
        this.userId = Number(id);
      },
      toggleNoticeModal: function() {
        this.dialogPostFlag = !this.dialogPostFlag
      },
      statusBoard: function(){
        this.toggleNoticeModal();
        axios.get('/states/' + this.userId + '/index')
        .then(response => {
          for (const status of response.data) {
              if (status.reason === "見るだけ") {
                this.statusA = true
              }else if(status.reason === "友達募集") {
                this.statusB = true
              }else if(status.reason === "メッセージOK") {
                this.statusC = true
              }else if(status.reason === "勉強会しましょう") {
                this.statusD = true
              }else if(status.reason === "一緒に研究") {
                this.statusE = true
              }else if(status.reason === "情報共有") {
                this.statusF = true
              }else if(status.reason === "同分野の人募集") {
                this.statusG = true
              }else if(status.reason === "誰でも歓迎") {
                this.statusH = true
              }
              }
        })
      },
      changeStatusA: function() {
        this.statusA = !this.statusA
        if (this.statusA === true) {
          axios.post('/states', {reason: 0 })
        }else if(this.statusA === false){
          console.log(this.userId)
          axios.delete('/states/' + this.userId, {data: {reason: 0}} )
        }
      },
      changeStatusB: function() {
        this.statusB = !this.statusB
        if (this.statusB === true) {
          axios.post('/states', {reason: 1 })
        }else if(this.statusB === false){
          axios.delete('/states/' + this.userId, {data: {reason: 1}})
        }
      },
      changeStatusC: function() {
        this.statusC = !this.statusC
        if (this.statusC === true) {
          axios.post('/states', {reason: 2 })
        }else if(this.statusC === false){
          axios.delete('/states/' + this.userId, {data: {reason: 2}})
        }
      },
      changeStatusD: function() {
        this.statusD = !this.statusD
        if (this.statusD === true) {
          axios.post('/states', {reason: 3 })
        }else if(this.statusD === false){
          axios.delete('/states/' + this.userId, {data: {reason: 3}})
        }
      },
      changeStatusE: function() {
        this.statusE = !this.statusE
        if (this.statusE === true) {
          axios.post('/states', {reason: 4 })
        }else if(this.statusE === false){
          axios.delete('/states/' + this.userId, {data: {reason: 4}})
        }
      },
      changeStatusF: function() {
        this.statusF = !this.statusF
        if (this.statusF === true) {
          axios.post('/states', {reason: 5 })
        }else if(this.statusF === false){
          axios.delete('/states/' + this.userId, {data: {reason: 5}})
        }
      },
      changeStatusG: function() {
        this.statusG = !this.statusG
        if (this.statusG === true) {
          axios.post('/states', {reason: 6 })
        }else if(this.statusG === false){
          axios.delete('/states/' + this.userId, {data: {reason: 6}})
        }
      },
      changeStatusH: function() {
        this.statusH = !this.statusH
        if (this.statusH === true) {
          axios.post('/states', {reason: 7 })
        }else if(this.statusH === false){
          axios.delete('/states/' + this.userId, {data: {reason: 7}})
        }
      },
  },
  created() {
      this.getId();
      this.getStatus();
  },
}
</script>

<style>
.v-application--wrap{
min-height: 10vh;
}
</style>
