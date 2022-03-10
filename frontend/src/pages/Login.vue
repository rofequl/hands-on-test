<template>
  <div class="c-app flex-row align-items-center"
       v-bind:style="{ backgroundImage: 'url(' + require('@/assets/images/login-background.jpg') + ')' }">
    <a-row type="flex" justify="space-around" align="middle">
      <a-col :span="6">

        <a-form :form="form" class="login-form user-layout-login"
                @submit="handleSubmit">
          <h4>Sign In to your account</h4>
          <a-alert v-if="isLoginError" type="error" showIcon style="margin-bottom: 24px;"
                   message="Invalid credentials"/>
          <a-form-item>
            <a-input
                size="large"
                placeholder="Email"
                v-decorator="[
                'email',
                {rules: [{ required: true, message: 'Please enter your email address' },{type: 'email',message: 'The input is not valid E-mail!'}]},
              ]"
            >
              <a-icon slot="prefix" type="user" :style="{ color: 'rgba(0,0,0,.25)' }"/>
            </a-input>
          </a-form-item>
          <a-form-item>
            <a-input-password
                size="large"
                placeholder="Password"
                v-decorator="[
                'password',
                {rules: [{ required: true, message: 'Please enter your password' },{ min: 6, message: 'Password minimum 6 character' }]}
              ]"
            >
              <a-icon slot="prefix" type="lock" :style="{ color: 'rgba(0,0,0,.25)' }"/>
            </a-input-password>
          </a-form-item>
          <a-form-item style="margin-top:24px">
            <a-button
                size="large"
                type="primary"
                html-type="submit"
                class="login-button"
                :loading="state.loginBtn"
                :disabled="state.loginBtn"
            >Login
            </a-button>
          </a-form-item>
        </a-form>
      </a-col>
    </a-row>
  </div>
</template>

<script>
import {mapActions} from 'vuex'

export default {
  name: "Login",
  data() {
    return {
      form: this.$form.createForm(this),
      isLoginError: false,
      state: {
        loginBtn: false
      }
    }
  },
  methods: {
    ...mapActions(['LOGIN']),
    handleSubmit: function (e) {
      e.preventDefault();

      const {form: {validateFields}, state, LOGIN} = this
      state.loginBtn = true
      validateFields(['email', 'password'], {force: true}, (err, values) => {
        if (!err) {
          const email = values.email;
          const password = values.password;
          LOGIN({email, password})
              .then(() => {
                this.$store.dispatch('VERIFY_AUTH')
                    .finally(() => this.$router.push({name: "dashboard"}))
              })
              .catch(err => this.requestFailed(err))
              .finally(() => {
                state.loginBtn = false
              })
        } else {
          setTimeout(() => {
            state.loginBtn = false
          }, 600)
        }
      });
    },
    requestFailed(err) {
      this.isLoginError = true
      this.$notification['error']({
        message: 'Warning',
        description: ((err.response || {}).data || {}).message || 'Invalid credentials',
        duration: 4
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.user-layout-login {
  label {
    font-size: 14px;
  }

  button.login-button {
    padding: 0 15px;
    font-size: 16px;
    height: 40px;
    width: 100%;
  }
}
</style>