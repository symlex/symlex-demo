import Vue from 'vue';
import Vuetify from 'vuetify';
import Router from 'vue-router';
import '../css/app.css';
import App from 'app/main.vue';
import routes from 'app/routes';
import Api from 'common/api';
import AppComponents from 'component/app-components';
import Alert from 'common/alert';
import Session from 'common/session';
import Event from 'pubsub-js';
import Moment from 'vue-moment';

const session = new Session(window.localStorage);

Vue.prototype.$event = Event;
Vue.prototype.$alert = Alert;
Vue.prototype.$session = session;
Vue.prototype.$api = Api;
Vue.prototype.$config = window.appConfig;

Vue.use(Vuetify, {
    theme: {
        primary: '#0097A7',
        secondary: '#757575',
        accent: '#546E7A',
        error: '#E57373',
        info: '#00B8D4',
        success: '#00BFA5',
        warning: '#E64A19',
        delete: '#E57373',
    },
});

Vue.use(Moment);
Vue.use(AppComponents);
Vue.use(Router);

const router = new Router({
    routes,
    mode: 'history',
    saveScrollPosition: true,
});

/* eslint-disable no-unused-vars */
const app = new Vue({
    el: '#app',
    router,
    render: h => h(App),
});
