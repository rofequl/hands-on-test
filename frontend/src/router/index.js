import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'

Vue.use(Router)

const isUserLoggedIn = (to, from, next) => store.getters.isAuthenticated ? next() : next({name: 'login'})

const isUserLoggedOut = (to, from, next) => store.getters.isAuthenticated ? next({name: 'dashboard'}) : next()

export default new Router({
    mode: 'history',
    linkActiveClass: 'active',
    scrollBehavior: () => ({y: 0}),
    routes: configRoutes()
})

function configRoutes() {
    return [
        {
            path: "/",
            redirect: "/dashboard",
            component: () => import("@/layout/Layout"),
            beforeEnter: isUserLoggedIn,
            children: [
                {
                    meta: {title: 'Dashboard'},
                    path: "/dashboard",
                    name: "dashboard",
                    component: () => import("@/pages/Dashboard")
                },
                {
                    meta: {title: 'Customer'},
                    path: "/customer",
                    name: "customer",
                    component: () => import("@/pages/Customer")
                },
                {
                    meta: {title: 'Customer Bills'},
                    path: "/customer-bill",
                    name: "bill",
                    component: () => import("@/pages/Bill")
                }
            ]
        },
        {
            meta: {title: 'User - Login'},
            path: "/login",
            name: "login",
            beforeEnter: isUserLoggedOut,
            component: () => import("@/pages/Login"),
        }
    ]
}