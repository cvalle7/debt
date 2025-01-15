import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faMoneyBillWave } from '@fortawesome/free-solid-svg-icons';
import { faMoneyBill } from '@fortawesome/free-solid-svg-icons';
import { faCoins } from '@fortawesome/free-solid-svg-icons';
import { faCreditCard } from '@fortawesome/free-solid-svg-icons';
import { createPinia } from 'pinia';
import piniaPersistedState from 'pinia-plugin-persistedstate';


library.add(faCoins);
library.add(faMoneyBill);
library.add(faMoneyBillWave);
library.add(faCreditCard);

const pinia = createPinia();
const app = createApp(App);

pinia.use(piniaPersistedState);
app.use(pinia);
app.component('font-awesome-icon', FontAwesomeIcon);
app.use(router);
app.mount('#app');
