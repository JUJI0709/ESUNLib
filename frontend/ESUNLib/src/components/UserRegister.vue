<template>
  <div>
    <h1>Register</h1>
    <div v-if="errorMessage">{{ errorMessage }}</div>
    <input type="text" placeholder="Mobile Number" v-model="mobileNumber">
    <input type="text" placeholder="Username" v-model="username">
    <input type="password" placeholder="Password" v-model="password">
    <button @click="register">Register</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      mobileNumber: '',
      username: '',
      password: '',
      errorMessage: '',
      phoneNumber:'',
      userName: ''
    };
  },
  methods: {
    register() {
      if (this.validateInput()) {
        // 假設您有一個後端API來處理註冊請求
        // 您將需要使用HTTP客戶端如axios來發送請求
        axios.post('/api/register', {
          mobileNumber: this.mobileNumber,
          username: this.username,
          password: this.password,
          phoneNumber: this.phoneNumber, // 添加这行
          userName: this.userName       // 添加这行
        }).then(response => {
          // 處理響應
        }).catch(error => {
          // 處理錯誤
        });

        console.log("Registered:", this.mobileNumber, this.username, this.password);
        // 清空表單
        this.mobileNumber = '';
        this.username = '';
        this.password = '';
        this.phoneNumber = ''; 
        this.userName = '';    
        this.errorMessage = '';
      }
    },
    validateInput() {
      // 簡單的驗證規則
      if (!this.mobileNumber.match(/^\d{10}$/)) {
        this.errorMessage = "Invalid mobile number. Must be 10 digits.";
        return false;
      }
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
