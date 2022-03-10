import Vue from "vue";
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import {Form} from 'vform';
import {ClientTable} from 'vue-tables-2';


Vue.use(Antd);
window.Form = Form;
Vue.use(ClientTable, {}, false, 'bootstrap4', {});