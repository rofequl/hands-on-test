<template>
  <a-layout id="components-layout-demo-custom-trigger">
    <a-layout-header style="background: #fff; padding: 0">
      <a-menu mode="horizontal" :style="{ lineHeight: '64px' }">
        <a-menu-item key="2" style="float: right">
          <a-dropdown>
            <a class="ant-dropdown-link" @click="e => e.preventDefault()">
              {{ $store.getters.currentUser.name }}
              <a-icon type="down"/>
            </a>
            <a-menu slot="overlay">
              <a-menu-item>
                <a href="logout" @click.prevent="$store.dispatch('LOGOUT')">Logout</a>
              </a-menu-item>
            </a-menu>
          </a-dropdown>
        </a-menu-item>
      </a-menu>
    </a-layout-header>
    <a-layout-content
        :style="{ margin: '24px 16px', padding: '24px', background: '#fff', minHeight: '280px' }">
      <CustomerBill/>
    </a-layout-content>
  </a-layout>
</template>

<script>
import CustomerBill from "@/components/CustomerBill";

export default {
  name: "Index",
  components: {CustomerBill},
}
</script>

<style>
#components-layout-demo-custom-trigger {
  min-height: 100vh;
}

#components-layout-demo-custom-trigger .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: pointer;
  transition: color 0.3s;
}

#components-layout-demo-custom-trigger .trigger:hover {
  color: #1890ff;
}

#components-layout-demo-custom-trigger .logo {
  height: 32px;
  background: rgba(255, 255, 255, 0.2);
  margin: 16px;
}
</style>