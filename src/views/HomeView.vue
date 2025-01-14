<template>
    <div class="container">
        <h1>Welcome to debt app</h1>
        <div v-for="(debt, index) in cardList" :key="index" class="debt-container">
            <router-link :to="{name: 'Debt', params: {debt: debt}}">
                <DebtCard :debtObject="debt" />
            </router-link>
        </div>
    </div>
</template>

<script>
import DebtCard from '@/components/DebtCard.vue';
import debtService from '@/services/debt.service'

export default {
    name: 'HomeView',
    components: {
        DebtCard
    },
    data() {
        return {
            cardList: []
        }
    },
    methods: {
        getAll() {
            this.cardList = debtService.getAllDebt()
            debtService.getAllDebt();
        }
    },
    mounted() {
        this.getAll()
    }
}
</script>

<style scoped>
.container {
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
}

.debt-container {
    width: 30%;
    margin-bottom: 1%;
}
</style>