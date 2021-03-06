import Vue from 'vue'
import Vuex from 'vuex'

import auth from "@/store/module/Auth";
import customer from "@/store/module/Customer";
import bill from "@/store/module/bill";
import customerbill from "@/store/module/customerbill";

Vue.use(Vuex)

export default new Vuex.Store({
    modules: {
        auth,
        customer,
        bill,
        customerbill
    }
})