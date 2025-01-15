import DebtView from "@/views/DebtView.vue";
import HomeView from "@/views/HomeView.vue";
import { createRouter, createWebHistory } from "vue-router";

const routes = [
    {
        path: '/',
        name: 'Home',
        component: HomeView
    },
    {
        path: '/debt',
        name: 'Debt',
        component: DebtView,
        props: true
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router;