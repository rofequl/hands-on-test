<template>
  <a-modal
      :title="modalAdd? 'Add new customer':'Customer information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Customer Name:">
            <a-input v-model="form.name" placeholder="Enter customer name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="email" has-feedback="" prop="email"
                             label="Customer Email:">
            <a-input v-model="form.email" placeholder="Enter customer email address..."
                     @blur="() => {$refs.email.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="password" has-feedback="" prop="password"
                             label="Customer Password:">
            <a-input v-model="form.password" placeholder="Enter customer password..."
                     @blur="() => {$refs.password.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="address" has-feedback="" prop="address"
                             label="Customer Address:">
            <a-input v-model="form.address" placeholder="Enter customer address..."
                     @blur="() => {$refs.address.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
export default {
  name: "CustomerAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        email: '',
        password: '',
        address: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Customer name is required', trigger: 'blur'},
          {max: 50, message: 'Customer name maximum length 50 character', trigger: 'change'},
        ],
        email: [
          {required: true, message: 'Customer email is required', trigger: 'blur'},
          {max: 50, message: 'Customer email maximum length 50 character', trigger: 'change'},
        ],
        password: [
          {required: true, message: 'Customer password is required', trigger: 'blur'},
          {max: 50, message: 'Customer password maximum length 20 character', trigger: 'change'},
          {min: 6, message: 'Customer password minimum length 6 character', trigger: 'change'},
        ],
        address: [
          {required: true, message: 'Customer address is required', trigger: 'blur'},
          {max: 100, message: 'Customer address maximum length 100 character', trigger: 'change'},
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
          this.form.post('customer')
              .then(({data}) => {
                this.$store.commit('CUSTOMER_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Customer add successfully.',
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
          this.form.put('customer/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('CUSTOMER_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Customer update successfully.',
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
  },
}
</script>

<style scoped>

</style>