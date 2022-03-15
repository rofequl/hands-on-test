import ApiService from "@/core/services/api.service";

export default {
    state: {
        customerBill: [],
    },

    getters: {
        customerBillList: state => state.customerBill,
        customerBillIndex: state => id => state.customerBill.findIndex(value => value.id === id) + 1,
    },

    actions: {
        CUSTOMER_BILL_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("customer-bill")
                    .then(({data}) => {
                        commit('SET_CUSTOMER_BILL_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        }
    },
    mutations: {
        SET_CUSTOMER_BILL_LIST: (state, data) => {
            state.customerBill = data;
        }
    }

}