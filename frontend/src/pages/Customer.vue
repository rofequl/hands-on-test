<template>
  <div>
    <!-- Page Header -->
    <h2 class="page-title" style="float: left">Customer</h2>
    <a-button type="primary" @click="$refs.child.modal()" style="float: right">Add new Customer</a-button>
    <div style="clear: both"></div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="customerList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">{{ customerIndex(props.row.id) }}</div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this Customer?"
                          ok-text="Yes"
                          cancel-text="No"
                          @confirm="confirm(props.row.id)">
              <a-button icon="delete"/>
            </a-popconfirm>
          </a-button-group>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->

    <!-- Modal -->
    <CustomerAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import CustomerAdd from "@/components/CustomerAdd";
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "Customer",
  components: {CustomerAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.customerList.length > 0) await this.$store.dispatch('CUSTOMER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('customer/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
              });
            } else {
              this.$store.commit('CUSTOMER_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Customer delete successfully.',
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
    }
  },
  computed: {
    ...mapGetters(["customerList", "customerIndex"]),
    columns() {
      return ['serial', 'name', 'email', 'address', 'action']
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Customer Name',
          email: 'Customer Email',
          address: 'Customer Address',
        },
        sortable: ['name', 'email', 'address'],
        filterable: ['name', 'email', 'address']
      }
    }
  }
}
</script>

<style scoped>

</style>