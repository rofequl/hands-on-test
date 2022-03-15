<template>
  <diV>
    <!-- Page Header -->
    <h2 class="page-title">Customer Bills</h2>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="customerBillList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">{{ customerBillIndex(props.row.id) }}</div>
        <div slot="created_at" slot-scope="props">{{ moment(props.row.created_at).format('LL') }}</div>
        <div slot="status" slot-scope="props">
          <a-tag v-if="props.row.status === 1" color="#23aa49">Due</a-tag>
          <a-tag v-else-if="props.row.status === 2" color="#81309c">Paid</a-tag>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->
  </diV>
</template>

<script>
import moment from "moment";
import {mapGetters} from "vuex";

export default {
  name: "CustomerBill",
  data() {
    return {
      moment
    }
  },
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.customerBillList.length > 0) await this.$store.dispatch('CUSTOMER_BILL_LIST');
    this.$refs.table.setLoadingState(false)
  },
  computed: {
    ...mapGetters(["customerBillList", "customerBillIndex"]),
    columns() {
      return ['serial', 'bill_month', 'year', 'amount', 'status', 'created_at',]
    },
    options() {
      return {
        filterByColumn: true,
        headings: {
          serial: '#',
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