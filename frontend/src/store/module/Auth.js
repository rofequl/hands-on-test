import ApiService from "@/core/services/api.service";
import JwtService from "@/core/services/jwt.service";
import router from "../../router";

const auth = {
    state: {
        user: {},
        isLoad: false,
        isAuthenticated: !!JwtService.getToken(),
    },
    getters: {
        isAuthenticated: state => state.isAuthenticated,
        currentUser: state => state.user,
        isLoadProfile: state => state.isLoad,
    },
    actions: {
        LOGIN({commit}, credentials) {
            return new Promise((resolve, reject) => {
                console.log("Done")
                ApiService.post("auth/login", credentials)
                    .then(({data}) => {
                        commit('SET_AUTH', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        LOGOUT({commit, state}) {
            if (state.isAuthenticated) {
                ApiService.post("auth/logout")
                commit('PURGE_AUTH');
                router.push({name: 'login'});
            }
        },
        VERIFY_AUTH({commit, state}) {
            return new Promise((resolve, reject) => {
                if (JwtService.getToken()) {
                    ApiService.setHeader();
                    ApiService.get("auth/user")
                        .then(({data}) => {
                            commit('SET_AUTH_USERS', data);
                            resolve();
                        })
                        .catch(error => {
                            reject(error)
                        })
                        .finally(state.isLoad = true)
                } else {
                    resolve();
                }
            });
        },
    },
    mutations: {
        SET_AUTH: (state, user) => {
            state.isAuthenticated = true;
            let token = user.token.split("|");
            JwtService.saveToken(token[1]);
        },
        SET_AUTH_USERS: (state, user) => {
            state.user = user;
        },
        PURGE_AUTH: (state) => {
            state.isAuthenticated = false;
            state.user = {};
            JwtService.destroyToken();
        },
    }
};

export default auth