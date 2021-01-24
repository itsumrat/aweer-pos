<template>
  <div id="app" class="container">
    <div class="col-md-8">
      <div class="row">
        <div class="col-md-6">
          <label>Select customer name</label>
          <v-select class="style-chooser" placeholder="Select customer" label="name"  v-model="order.customer" :options="customers"/>    
        </div>
        <div class="col-md-6">
          <label>Select product name</label>
          <v-select taggable class="style-chooser" placeholder="Select product" label="code"  @search:blur="search" :options="items" v-model="searchQuery"/>  
        </div>
      </div>  
      <br/>
      </hr/>
      <table class="table table-striped table-hover table-bordered table-responsive">
        <thead>
          <tr>
              <th>Item Details</th>
              <th>Unit Price</th>
              <th>Quantity</th>
              <th>Line Total</th>
              <th></th>
          </tr>
        </thead>
        <tbody> 
            <tr v-for="item in lineItems">
                <td>{{ item.item.name }}</td>
                <td>{{ item.item.price }}</td>
                <td>
                    <span v-if="!item.editing" v-on:dblclick=" toggleEdit(item)" >{{ item.numberOfItems }}</span>
                    <input v-if="item.editing" v-on:blur=" toggleEdit(item)" type="number" v-model="item.numberOfItems">
                </td>
                <td>{{  item.numberOfItems * item.item.price }}</td>
                <td><i class="fa fa-times" v-on:click="removeItem(item)"></i></td>
            </tr>
        </tbody>
      </table>
      <table class="table">
        <thead style="background-color: #dbeef3;color:#424d68;">
          <tr>
            <th>Subtotal</th>
            <th>Total</th>
            <th>Vat</th>
            <th>Grand Total</th>
          </tr>
        </thead>
        <tbody style="background-color: #dbeef3;">
            <tr>                                
                <th>{{ subtotal  }}</th>
                <th>{{  total  }}</th>
                <th>{{  tax  }}</th>
                <th>{{  grandTotal  }}</th>
            </tr>
        </tbody>
        <tfoot>
          <tr>
            <th colspan=3 style="background-color: #f2f2f2;">Amount to be paid</th>
            <th>{{  grandTotal  }}</th>
          </tr>
        </tfoot>
      </table>
      <hr/>
      <table width="100%">
        <tr>
          <td class="btn btn-success" v-on:click="placeorder()">Cash</td>
          <td class="btn btn-primary" v-on:click="creditorder()">Credit</td>
          <td class="btn btn-warning" v-on:click="holdorder()">Hold</td>
          <td><a href="pos" class="btn btn-danger">Cancel</a></td>
        </tr>
      </table>
      <!-- <button class="btn-primary float-right" v-on:click="placeorder()">Order</button> -->
    </div>

    <div class="col-md-3">
      <table class="table table-striped table-hover table-bordered table-responsive">
        <thead>
          <tr>
            <th colspan=5><center>HOLDED BILLS</center></th>
          </tr>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>trx no.</th>
            <th>Amount</th>
            <th>P.Type</th>
          </tr>
        </thead>
        <!-- <tr v-for="(holdorder,value) in holdorders" v-on:click="onItemClick(item)"> -->
          <tr v-for="(holdorder,value) in holdorders" v-on:click="loadhold(holdorder)">
          <td> {{value+1}} </td>
          <td> {{holdorder.created_at}} </td>
          <td> {{holdorder.id}} </td>
          <td> {{holdorder.total}} </td>
          <td> {{holdorder.status}} </td>
        </tr>
      </table>

      <table class="table table-striped table-hover table-bordered table-responsive">
        <thead>
          <tr>
            <th colspan=5><center>LASTEST TRANSITION</center></th>
          </tr>
          <tr>
            <th>#</th>
            <th>Date</th>
            <th>trx no.</th>
            <th>Amount</th>
            <th>P.Type</th>
          </tr>
        </thead>
        <tr v-for="(order,value) in orders" v-on:click="onItemClick(item)">
          <td> {{value+1}} </td>
          <td> {{order.created_at}} </td>
          <td> {{order.id}} </td>
          <td> {{order.total}} </td>
          <td> {{order.status}} </td>
        </tr>
      </table>
    </div>
    
  </div>
</template>

<style>
  .style-chooser .vs__search::placeholder,
  .style-chooser .vs__dropdown-toggle,
  .style-chooser .vs__dropdown-menu {
    background: #dfe5fb;
    border: none;
    color: #394066;
    text-transform: lowercase;
    font-variant: small-caps;
  }

  .style-chooser .vs__clear,
  .style-chooser .vs__open-indicator {
    fill: #394066;
  }
</style>

<script>
import {bus} from "./app";
export default {
  name: 'app',
  // props: [customer],
  data () {
    return {
      customers: [],
      items: [],
      orders: [],
      holdorders: [],
      lineItems: [],
      searchcus:null,
      searchQuery: null,
      c_name: "Select Customer",
      c_phone: "Select Customer",
      order: {
        id:0,
        customer: null,
        lineItems: [],
        grandTotal: 0,
        status: 0
      }
    }
  },
  created: function() {          
      const requestOne = axios.get('getproductlist');
      const requestTwo = axios.get('getcustomerlist');
      const requestThree = axios.get('getorderlist');
      const requestFour = axios.get('getholdorderlist');
      requestOne.then(response => (this.items = response.data));
      requestTwo.then(response => {this.customers = response.data; this.order.customer = this.customers[0]; });
      
      requestThree.then(response => (this.orders = response.data));
      requestFour.then(response => (this.holdorders = response.data));
      bus.$on('newcustomer',(data)=>{
        this.c_name = data.name;
        this.c_phone = data.phone;
        this.order.customer = data;
      });
  },
  methods: {
    placeorder: function(){
      if(this.lineItems.length==0){
        alert("Can't order with empty cart!");
        return;
      }
      this.order.lineItems = this.lineItems;
      this.order.grandTotal = this.grandTotal;
      this.order.status = 1;
      axios.post('order', {
                  order: this.order
                })
                .then(response => {
                  var resp = JSON.stringify(response.data.id);
                  // console.log(resp);
                  // window.location.href = 'order/printinvoice?id='+resp;
                  window.location.href = 'order/printinvoice?id='+resp;
                })
                .catch(e => {
                  console.log(e);
                })
    },
    creditorder: function(){
      if(this.lineItems.length==0){
        alert("Can't order with empty cart!");
        return;
      }
      this.order.lineItems = this.lineItems;
      this.order.grandTotal = this.grandTotal;
      this.order.status = 2;
      axios.post('order', {
                  order: this.order
                })
                .then(response => {
                  var resp = JSON.stringify(response.data.id);
                  // console.log(resp);
                  // window.location.href = 'order/printinvoice?id='+resp;
                  // window.location.href = 'order/printinvoice?id='+resp;
                  window.location.href = 'pos';
                })
                .catch(e => {
                  console.log(e);
                })
    },
    holdorder: function(){
      if(this.lineItems.length==0){
        alert("Can't order with empty cart!");
        return;
      }
      this.order.lineItems = this.lineItems;
      this.order.grandTotal = this.grandTotal;
      this.order.status = 3;
      axios.post('order', {
                  order: this.order
                })
                .then(response => {
                  var resp = JSON.stringify(response.data.id);
                  // console.log(resp);
                  // window.location.href = 'order/printinvoice?id='+resp;
                  window.location.href = 'pos';
                })
                .catch(e => {
                  console.log(e);
                })
    },
    loadhold:function(holder){
      // console.log(holder);
      var getholder = axios.get('getsingleorder?id='+holder.id);
      getholder.then(response => {
          // console.log(response);
          this.c_name = response.data.name;
          this.c_phone = response.data.phn;
          this.lineItems = response.data.products;
          this.customers.filter((i)=>{
            if(i.phone === response.data.phn){
                this.order.customer = i;
            }
          });
          this.order.id = response.data.invoice_no;
       } );
    },
    
    onItemClick: function(item) {
      //console.log(item);
      var found = false;

      for (var i = 0; i < this.lineItems.length; i++) {
          if (this.lineItems[i].item === item) {
              this.lineItems[i].numberOfItems++;
              found = true;
              break;
          }
      }
      if (!found) {
          this.lineItems.push({ item: item, numberOfItems: 1, editing: false });
      }
    },
    toggleEdit: function(lineItem) {  
        lineItem.editing = !lineItem.editing;
    },
    removeItem: function(lineItem) {
        for (var i = 0; i < this.lineItems.length; i++) {
            if (this.lineItems[i] === lineItem) {
                this.lineItems.splice(i, 1);
                break;
            }
        }
    },
    searchcustomer(){
      if(this.searchcus){
        this.customers.filter((i)=>{
          if(i.name.toLowerCase() === this.searchcus.toLowerCase() || i.phone === this.searchcus){
              this.c_phone = i.phone;
              this.c_name = i.name;
              this.order.customer = i;
          }
        });
      }
    },
    search(event){
      console.log("Hello");
      // console.log(event);
      if(this.searchQuery){
        this.items.filter((i)=>{
          if(i.code.toLowerCase() === this.searchQuery.code.toLowerCase()){
            // if(i.code.toLowerCase() === event.code.toLowerCase()){
              this.onItemClick(i);
          }
        });
      }
    },
    roundToTwoDigitsAfterComma(floatNumber) {
      return parseFloat((Math.round(floatNumber * 100) / 100).toFixed(2));
    },

  },
  computed: {
    subtotal: function() {
      var subtotal = 0;
      this.lineItems.forEach(function(item) {
          subtotal += item.item.price * item.numberOfItems;
      });
      return this.roundToTwoDigitsAfterComma(subtotal);
    },
    tax: function() {
        return this.roundToTwoDigitsAfterComma(this.subtotal * 0.065);
    },
    total: function() {
        return this.roundToTwoDigitsAfterComma(this.subtotal);
    },
    grandTotal: function(){
        return this.roundToTwoDigitsAfterComma(this.total + this.tax);
    }
  }
};
</script>

<style>

</style>
