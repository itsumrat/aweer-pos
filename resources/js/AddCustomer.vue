<template>
  <div>
    <table class="table">
      <tr>
        <td>Code:</td>
        <td><input type="text" name="code" v-model="customer.code" ></td>
        <td>Email:</td>
        <td><input type="email" name="email" v-model="customer.email" ></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><input type="text" name="code" v-model="customer.name"></td>
        <td>City</td>
        <td><input type="text" name="city" v-model="customer.city"></td>
      </tr>
      <tr>
        <td>Phone:</td>
        <td><input type="text" name="phone" v-model="customer.phone"></td>
        <td>Country</td>
        <td><input type="text" name="country"  v-model="customer.country"></td>
      </tr>
      <tr>
        <td>Address:</td>
        <td><input type="text" name="address"  v-model="customer.address"></td>
        <td>Type</td>
        <td><input type="text" v-model="customer.type"/></td>
      </tr>
      <tr>
        <td colspan="4"><button class="btn btn-primary float-right" v-on:click="creatCustomer()" data-dismiss="modal">SUBMIT</button></td>
      </tr>
    </table>
  </div>
</template>

<script>
import {bus} from "./app";
  export default {
    
    data () {
      return {
        // ctype: ["WalkInCustomer","Regular customer"],
        customer: {
          id: 0,
          code: "",
          email: "",
          name: "",
          city: "",
          phone: "",
          country: "",
          address: "",
          type: ""
        }
      }
    },
    methods: {
      creatCustomer: function(){
        axios.post('savecustomer', {
                    customer: this.customer
                  })
                  .then(response => {
                    var resp = JSON.stringify(response.data.id);
                    this.customer.id = resp;
                    // console.log(resp);
                    // window.location.href = 'order/printinvoice?id='+resp;
                    // window.location.href = 'pos';
                    bus.$emit('newcustomer',this.customer);
                  })
                  .catch(e => {
                    console.log(e);
                  })
      },
    }
  }
</script>

