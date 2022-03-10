<template>
  <div>
    <!-- Page Header -->
    <h2 class="page-title" style="float: left">Customer Bills</h2>
    <a-button type="primary" @click="$refs.child.modal()" style="float: right">Bills Generate</a-button>
    <div style="clear: both"></div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="billList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="customer" slot-scope="props">{{ props.row.customerName }}<br>{{ props.row.customerEmail }}</div>
        <div slot="serial" slot-scope="props">{{ billIndex(props.row.id) }}</div>
        <div slot="created_at" slot-scope="props">{{ moment(props.row.created_at).format('LL') }}</div>
        <div slot="status" slot-scope="props">
          <a-tag v-if="props.row.status === 1" color="#23aa49">Due</a-tag>
          <a-tag v-else-if="props.row.status === 2" color="#81309c">Paid</a-tag>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this Customer bill?"
                          ok-text="Yes"
                          cancel-text="No"
                          @confirm="confirm(props.row.id)">
              <a-button icon="delete"/>
            </a-popconfirm>
            <a-dropdown>
              <a-menu slot="overlay">
                <a-menu-item key="1" @click="billChange(1, props.row.status, props.row.id)"> Due</a-menu-item>
                <a-menu-item key="2" @click="billChange(2, props.row.status, props.row.id)"> Paid</a-menu-item>
              </a-menu>
              <a-button style="margin-left: 8px">Billing Status
                <a-icon type="down"/>
              </a-button>
            </a-dropdown>
          </a-button-group>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->

    <!-- Modal -->
    <BillAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import BillAdd from "@/components/BillAdd";
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";
import moment from 'moment'

export default {
  name: "Bill",
  data() {
    return {
      moment
    }
  },
  components: {BillAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.billList.length > 0) await this.$store.dispatch('BILL_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('bill/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
              });
            } else {
              this.$store.commit('BILL_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Customer bill delete successfully.',
              });
            }
          })
          .catch(err => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    },
    billChange(newData, oldData, id) {
      if (newData !== oldData) this.$store.dispatch('BILL_STATUS', {newData, id});
    },
  },
  computed: {
    ...mapGetters(["billList", "billIndex"]),
    columns() {
      return ['serial', 'customer', 'bill_month', 'year', 'amount', 'status', 'created_at', 'action']
    },
    options() {
      return {
        filterByColumn: true,
        headings: {
          serial: '#',
          customer: 'Customer Information',
          bill_month: 'Month',
        },
        listColumns: {
          status: [
            {
              id: 1,
              text: 'Due'
            },
            {
              id: 2,
              text: 'Paid'
            },
          ]
        },
        filterable: ['status']
      }
    }
  }
}
</script>

<style scoped>

</style>