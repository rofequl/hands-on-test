<template>
  <a-modal
      :title="modalAdd? 'Customer bill create':'customer bill edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="bill_month" has-feedback="" prop="bill_month"
                             label="Bill Month:">
            <a-select v-model="form.bill_month" style="width: 100%" placeholder="Select month" @blur="() => {$refs.bill_month.onFieldBlur();}">
              <a-select-option value="January">January</a-select-option>
              <a-select-option value="February">February</a-select-option>
              <a-select-option value="March">March</a-select-option>
              <a-select-option value="April">April</a-select-option>
              <a-select-option value="May">May</a-select-option>
              <a-select-option value="June">June</a-select-option>
              <a-select-option value="July">July</a-select-option>
              <a-select-option value="August">August</a-select-option>
              <a-select-option value="September">September</a-select-option>
              <a-select-option value="October">October</a-select-option>
              <a-select-option value="November">November</a-select-option>
              <a-select-option value="December">December</a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="year" has-feedback="" prop="year"
                             label="Bill Year:">
            <a-input-number v-model="form.year" placeholder="Enter bill year..." style="width: 100%"
                     @blur="() => {$refs.year.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="amount" has-feedback="" prop="amount"
                             label="Bill Amount:">
            <a-input-number v-model="form.amount" placeholder="Enter customer bill amount..."
                     @blur="() => {$refs.amount.onFieldBlur();}" style="width: 100%"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="customer_id" has-feedback="" prop="customer_id"
                             label="Customer Name:">
            <a-select show-search placeholder="Select customer" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.customer_id">
              <a-select-option v-for="customer in customerList" :key="customer.id" :value="customer.id">
                {{ customer.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "BillAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        bill_month: undefined,
        year: '',
        amount: '',
        customer_id: undefined,
      }),
      rules: {
        bill_month: [
          {required: true, message: 'Bill month is required', trigger: 'blur'},
        ],
        year: [
          {required: true, message: 'Bill year is required', trigger: 'blur'},
        ],
        amount: [
          {required: true, message: 'Bill amount is required', trigger: 'blur'},
        ],
        customer_id: [
          {required: true, message: 'Please select customer', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      if (!e) {
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('bill')
              .then(({data}) => {
                this.$store.commit('BILL_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Bills add successfully.',
                  duration: 4
                });
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  duration: 4
                })
              })
        } else {
          return false;
        }
      });
    },
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('bill/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('BILL_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Bills update successfully.',
                  duration: 4
                });
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  duration: 4
                })
              })
        } else {
          return false;
        }
      });
    },
    cancelForm() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  created() {
    if (!this.customerList.length > 0) this.$store.dispatch('CUSTOMER_LIST');
  },
  computed: {
    ...mapGetters(["customerList"])
  },
}
</script>

<style scoped>

</style>