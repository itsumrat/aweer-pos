<template>
    <div id="app" class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-6">
                        <label>Select customer name</label>
                        <v-select class="style-chooser" placeholder="Select customer" label="name" v-model="order.customer"
                                  :options="customers"/>
                    </div>
                    <div class="col-md-6">
                        <label>Select product name</label>
                        <v-select taggable class="style-chooser" placeholder="Select product" label="code"
                                  @search:blur="search" :options="items" v-model="searchQuery"/>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-12">
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
                                    <span v-if="!item.editing" v-on:dblclick=" toggleEdit(item)">{{ item.numberOfItems }}</span>
                                    <input v-if="item.editing" v-on:blur=" toggleEdit(item)" type="number"
                                           v-model="item.numberOfItems">
                                </td>
                                <td>{{ item.numberOfItems * item.item.price }}</td>
                                <td><i class="fa fa-times" v-on:click="removeItem(item)"></i></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <table class="table table-striped table-hover table-bordered table-responsive">
                            <thead>
                            <tr>
                                <th colspan=5>
                                    <center>HOLDED BILLS</center>
                                </th>
                            </tr>
                            <tr>
                                <th colspan=5>
                                    <input placeholder="Search" class="form-control">
                                </th>
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
                                <td> {{ value + 1 }}</td>
                                <td> {{ holdorder.created_at }}</td>
                                <td> {{ holdorder.id }}</td>
                                <td> {{ holdorder.total }}</td>
                                <td> {{ holdorder.status }}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table class="table table-striped table-hover table-bordered table-responsive">
                            <thead>
                            <tr>
                                <th colspan=5>
                                    <center>LASTEST TRANSITION</center>
                                </th>
                            </tr>
                            <tr>
                                <th colspan=5>
                                    <input placeholder="Search" class="form-control">
                                </th>
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
                                <td> {{ value + 1 }}</td>
                                <td> {{ order.created_at }}</td>
                                <td> {{ order.id }}</td>
                                <td> {{ order.total }}</td>
                                <td> {{ order.status }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- <button class="btn-primary float-right" v-on:click="placeorder()">Order</button> -->
            </div>

            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table  table-striped table-hover table-bordered table-responsive">
                            <tbody style="background-color: #dbeef3;">
                            <tr>
                                <th>Subtotal</th>
                                <th>{{ subtotal }}</th>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <th>{{ total }}</th>
                            </tr>
                            <tr>
                                <th>Vat</th>
                                <th>{{ tax }}</th>
                            </tr>
                            <tr>
                                <th>Grand Total</th>
                                <th>{{ grandTotal }}</th>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th style="background-color: #f2f2f2;">Amount to be paid</th>
                                <th>{{ grandTotal }}</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
<!--                            <div class="col-md-3"> <button class="btn btn-success" v-on:click="placeorder()">Cash</button> </div>-->
<!--                            <div class="col-md-3"> <button class="btn btn-primary" v-on:click="creditorder()">Credit</button> </div>-->
                            <div class="col-md-6" style="padding-right: 0px"> <button class="btn btn-warning btn-block">SUSPEND</button> </div>
                            <div class="col-md-6" style="padding-left: 0px"> <button class="btn btn-dark btn-block" v-on:click="holdorder()">HOLD</button> </div>
                            <div class="col-md-12"> <button class="btn btn-success btn-block" data-toggle="modal" data-target="#exampleModal">CHECKOUT</button> </div>
<!--                            <div class="col-md-12"> <a href="pos" class="btn btn-danger btn-block">Cancel</a> </div>-->
                        </div>
                    </div>

                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel"><strong>COMPLETE PAYMENT PROCESS</strong></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Select Customer Name</label>
                                                <v-select class="style-chooser" placeholder="Select customer" label="name" v-model="order.customer"
                                                          :options="customers"/>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>:</label>
                                                <br>
                                                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModal">+</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <button class="btn text-success btn-block btn-lg" @click="CashOrCard('cash')"><b> CASH </b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn text-warning btn-block btn-lg" @click="CashOrCard('card')"> <b>CARD</b> </button>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-12 text-center">
                                            Subtotal : {{ subtotal }} &nbsp;|&nbsp; Discount : 0.00 &nbsp;|&nbsp; Tax Total : {{ tax }} &nbsp;|&nbsp; Delivery Charge : 0.00
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row" v-if="cash_or_card == 'cash'">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Punch Amount</label>
                                                <input class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Change Amount</label>
                                                <input class="form-control" :value="Math.ceil(grandTotal)" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Amount Rounded</label>
                                                <input class="form-control" :value="parseFloat(Math.ceil(grandTotal) - grandTotal).toFixed(2)">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" v-if="cash_or_card == 'card'">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Card No</label>
                                                <input class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Card Type</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                <label class="form-check-label" for="flexCheckDefault">
                                                    Visa
                                                </label>
                                                &nbsp;
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                                <label class="form-check-label" for="flexCheckDefault1">
                                                    Master
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <button type="button" class="btn btn-primary btn-block btn-lg" @click="payNow()">PAY {{ grandTotal }}</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <hr/>
            </div>
        </div>
    </div>
</template>

<script>
    import {bus} from "./app";
    import 'vue-select/dist/vue-select.css';
    export default {
        name: 'app',
        // props: [customer],
        data() {
            return {
                customers: [],
                items: [],
                orders: [],
                holdorders: [],
                lineItems: [],
                searchcus: null,
                searchQuery: null,
                c_name: "Select Customer",
                c_phone: "Select Customer",
                order: {
                    id: 0,
                    customer: null,
                    lineItems: [],
                    grandTotal: 0,
                    status: 0
                },

                cash_or_card : 'cash',
            }
        },
        created: function () {
            const requestOne = axios.get('getproductlist');
            const requestTwo = axios.get('getcustomerlist');
            const requestThree = axios.get('getorderlist');
            const requestFour = axios.get('getholdorderlist');

            requestOne.then(response => (this.items = response.data));
            requestTwo.then(response => {
                this.customers = response.data;
                this.order.customer = this.customers[0];
            });

            requestThree.then(response => (this.orders = response.data));
            requestFour.then(response => (this.holdorders = response.data));
            bus.$on('newcustomer', (data) => {
                this.c_name = data.name;
                this.c_phone = data.phone;
                this.order.customer = data;
            });
        },
        methods: {
            placeorder: function () {
                if (this.lineItems.length == 0) {
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
                        window.location.href = 'order/printinvoice?id=' + resp;
                    })
                    .catch(e => {
                        console.log(e);
                    })
            },
            creditorder: function () {
                if (this.lineItems.length == 0) {
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
            holdorder: function () {
                if (this.lineItems.length == 0) {
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
            loadhold: function (holder) {
                // console.log(holder);
                var getholder = axios.get('getsingleorder?id=' + holder.id);
                getholder.then(response => {
                    // console.log(response);
                    this.c_name = response.data.name;
                    this.c_phone = response.data.phn;
                    this.lineItems = response.data.products;
                    this.customers.filter((i) => {
                        if (i.phone === response.data.phn) {
                            this.order.customer = i;
                        }
                    });
                    this.order.id = response.data.invoice_no;
                });
            },

            onItemClick: function (item) {
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
                    this.lineItems.push({item: item, numberOfItems: 1, editing: false});
                }
            },
            toggleEdit: function (lineItem) {
                lineItem.editing = !lineItem.editing;
            },
            removeItem: function (lineItem) {
                for (var i = 0; i < this.lineItems.length; i++) {
                    if (this.lineItems[i] === lineItem) {
                        this.lineItems.splice(i, 1);
                        break;
                    }
                }
            },
            searchcustomer() {
                if (this.searchcus) {
                    this.customers.filter((i) => {
                        if (i.name.toLowerCase() === this.searchcus.toLowerCase() || i.phone === this.searchcus) {
                            this.c_phone = i.phone;
                            this.c_name = i.name;
                            this.order.customer = i;
                        }
                    });
                }
            },
            search(event) {
                console.log("Hello");
                // console.log(event);
                if (this.searchQuery) {
                    this.items.filter((i) => {
                        if (i.code.toLowerCase() === this.searchQuery.code.toLowerCase()) {
                            // if(i.code.toLowerCase() === event.code.toLowerCase()){
                            this.onItemClick(i);
                        }
                    });
                }
            },
            roundToTwoDigitsAfterComma(floatNumber) {
                return parseFloat((Math.round(floatNumber * 100) / 100).toFixed(2));
            },

            CashOrCard(type) {
                const _this = this;
                _this.cash_or_card = type;
            },
            payNow() {
                const _this = this;
                if (_this.cash_or_card == 'card') {
                    _this.creditorder();
                } else {
                    _this.placeorder();
                }
            }

        },
        computed: {
            subtotal: function () {
                var subtotal = 0;
                this.lineItems.forEach(function (item) {
                    subtotal += item.item.price * item.numberOfItems;
                });
                return this.roundToTwoDigitsAfterComma(subtotal);
            },
            tax: function () {
                return this.roundToTwoDigitsAfterComma(this.subtotal * 0.065);
            },
            total: function () {
                return this.roundToTwoDigitsAfterComma(this.subtotal);
            },
            grandTotal: function () {
                return this.roundToTwoDigitsAfterComma(this.total + this.tax);
            }
        }
    };
</script>

<style scoped>
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

* {
    border-radius: 0 !important;
}

.btn-dark {
    background: #1b1e21;
    color: #fff;
}
.modal-header .close {
     margin-top: -19px;
 }
</style>
