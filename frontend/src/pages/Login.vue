<template>
  <div class="c-app flex-row align-items-center"
       v-bind:style="{ backgroundImage: 'url(' + require('@/assets/images/login-background.jpg') + ')' }">
    <a-row type="flex" justify="space-around" align="middle">
      <a-col :span="6">


          <h2 style="text-align: center">Sign In to your account</h2>

          <a-tabs @change="handleTabClick" :activeKey="customActiveKey"
                  :tabBarStyle="{ textAlign: 'center', borderBottom: 'unset' }">
            <a-tab-pane key="tab1" tab="User">
              <User/>
            </a-tab-pane>
            <a-tab-pane key="tab2" tab="Customer">
              <Customer/>
            </a-tab-pane>
          </a-tabs>


      </a-col>
    </a-row>
  </div>
</template>

<script>
import User from "@/components/login/User";
import Customer from "@/components/login/Customer";

export default {
  name: "Login",
  components: {User, Customer},
  data() {
    return {
      customActiveKey: 'tab1',
    }
  },
  methods: {
    handleTabClick(key) {
      this.customActiveKey = key
    }
  }
}
</script>

<style lang="scss" scoped>

</style>