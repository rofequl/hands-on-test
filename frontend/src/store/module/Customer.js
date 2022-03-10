import ApiService from "@/core/services/api.service";

export default {
    state: {
        customer: [],
    },

    getters: {
        customerList: state => state.customer,
        customerIndex: state => id => state.customer.findIndex(value => value.id === id) + 1,
    },

    actions: {
        CUSTOMER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("customer")
                    .then(({data}) => {
                        commit('SET_CUSTOMER_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_CUSTOMER_LIST: (state, data) => {
            state.customer = data;
        },
        CUSTOMER_MODIFY: (state, data) => {
            Object.assign(state.customer.find(element => element.id === data.id), data);
        },
        CUSTOMER_ADD: (state, data) => {
            state.customer.unshift(data);
        },
        CUSTOMER_REMOVE: (state, data) => {
            let index = state.customer.findIndex(value => value.id === data);
            state.customer.splice(index, 1);
        },
    }

}