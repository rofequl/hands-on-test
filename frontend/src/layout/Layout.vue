<template>
  <a-layout id="components-layout-demo-custom-trigger">
    <a-layout-sider v-model="collapsed" :trigger="null" collapsible>
      <div class="logo"/>
      <a-menu theme="dark" mode="inline" :default-selected-keys="['1']">
        <a-menu-item key="1">
          <a-icon type="user"/>
          <span>Dashboard</span>
        </a-menu-item>
        <a-menu-item key="2">
          <a-icon type="video-camera"/>
          <span>Customer</span>
        </a-menu-item>
        <a-menu-item key="3">
          <a-icon type="upload"/>
          <span>Bill</span>
        </a-menu-item>
      </a-menu>
    </a-layout-sider>
    <a-layout>
      <a-layout-header style="background: #fff; padding: 0">
        <a-menu mode="horizontal" :style="{ lineHeight: '64px' }">
          <a-menu-item key="1">
            <a-icon class="trigger" :type="collapsed ? 'menu-unfold' : 'menu-fold'"
                @click="() => (collapsed = !collapsed)"/>
          </a-menu-item>
          <a-menu-item key="2" style="float: right">
            <a-dropdown>
              <a class="ant-dropdown-link" @click="e => e.preventDefault()">
                {{ $store.getters.currentUser.name }} <a-icon type="down" />
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
        <router-view></router-view>
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>

<script>
export default {
  name: "Layout.vue",
  data() {
    return {
      collapsed: false,
    };
  },
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