<template>
  <div>
    <h1>Login</h1>
    <div v-if="errorMessage">{{ errorMessage }}</div>
    <input type="text" placeholder="Username" v-model="username">
    <input type="password" placeholder="Password" v-model="password">
    <button @click="login">Login</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      errorMessage: ''
    };
  },
  methods: {
    login() {
      if (this.validateInput()) {
        // 假設您有一個後端API來處理登入請求
        // 您將需要使用HTTP客戶端如axios來發送請求
        axios.post('/api/login', {
          username: this.username,
          password: this.password
        }).then(response => {
          // 處理登入成功
        }).catch(error => {
          // 處理登入錯誤
        });

        console.log("Login attempt:", this.username, this.password);
        // 清空表單
        this.username = '';
        this.password = '';
        this.errorMessage = '';
      }
    },
    validateInput() {
      if (!this.username) {
        this.errorMessage = "Username is required.";
        return false;
      }
      if (this.password.length < 6) {
        this.errorMessage = "Password must be at least 6 characters.";
        return false;
      }
      return true;
    }
  }
}
</script>
