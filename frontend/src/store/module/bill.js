import ApiService from "@/core/services/api.service";

export default {
    state: {
        bill: [],
    },

    getters: {
        billList: state => state.bill,
        billIndex: state => id => state.bill.findIndex(value => value.id === id) + 1,
    },

    actions: {
        BILL_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("bill")
                    .then(({data}) => {
                        commit('SET_BILL_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        BILL_STATUS({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_BILL_STATUS', data);
                ApiService.post("bill-status-change", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        }
    },
    mutations: {
        SET_BILL_LIST: (state, data) => {
            state.bill = data;
        },
        BILL_MODIFY: (state, data) => {
            Object.assign(state.bill.find(element => element.id === data.id), data);
        },
        BILL_ADD: (state, data) => {
            state.bill.unshift(data);
        },
        BILL_REMOVE: (state, data) => {
            let index = state.bill.findIndex(value => value.id === data);
            state.bill.splice(index, 1);
        },
        SET_BILL_STATUS: (state, data) => {
            state.bill.find(element => element.id === data.id).status = data.newData;
        },
    }

}