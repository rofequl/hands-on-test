import Vue from 'vue'
import router from './router'
import App from './App.vue'
import store from './store/index'
import ApiService from "@/core/services/api.service";

// Vue 3rd party plugins
import "./core/plugins/bootstrap";

ApiService.init();

Vue.config.performance = true
Vue.config.productionTip = false

router.beforeEach((to, from, next) => {
    store.getters.isLoadProfile ? next() : store.dispatch('VERIFY_AUTH').finally(next);
    setTimeout(() => {
        window.scrollTo(0, 0);
    }, 100);
    document.title = to.meta.title;
});

new Vue({
    router,
    store,
    render: h => h(App),
}).$mount('#app')