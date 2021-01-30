
require('./bootstrap');
import Vue from 'vue'
import App from './App.vue'
import Customer from './CustomerApp.vue'
import AddCustomer from './AddCustomer.vue'
import vSelect from 'vue-select'
import vuetable from 'vuetable-2'

Vue.component('v-select', vSelect)
Vue.component('customerapp',Customer)
Vue.component('app',App)
Vue.component('addcustomer',AddCustomer)
Vue.component('vuetable',vuetable)

export const bus = new Vue();

new Vue({
  el: '#mother',
  // render: h => h(App)
})
