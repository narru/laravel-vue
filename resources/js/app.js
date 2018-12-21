
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import moment from 'moment';

// form validation
import { Form, HasError, AlertError } from 'vform';
// globle component for form validation
window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)


// sweet alert
import swal from 'sweetalert2';
window.swal = swal;

const toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});

window.toast = toast;



import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'

Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '2px'
})

const routes = [
  { path: '/dashboard', component: require('./components/dashboard.vue') },
  { path: '/content', component: require('./components/content.vue') },
  { path: '/profile', component: require('./components/profile.vue') },
  { path: '/users', component: require('./components/users.vue') },
  { path: '/developer', component: require('./components/developer.vue') },
  { path: '/product', component: require('./components/backend/product/product.vue') },
  { path: '/addProduct', component: require('./components/backend/product/addProduct.vue') },
  { path: '/branch', component: require('./components/backend/branch/index.vue') }
]

const router = new VueRouter({
  mode: 'history',
  routes // short for `routes: routes`
})

window.Fire = new Vue();

// for capitalize the first letter
Vue.filter('capitalize', function(text) {
	return text.charAt(0).toUpperCase() + text.slice(1)
});

Vue.filter('myDate', function(created) {
	return moment(created).format('MMMM Do YYYY');
});



Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue')
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue')
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue')
);
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

Vue.component('example-component', require('./components/ExampleComponent.vue'));

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key)))

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router
});
