<template>
    <div class="container-home">
        <h1>Welcome to debt app</h1>
        <div v-for="(debt, index) in cardList" :key="index" class="debt-container">
            <router-link to="/debt">
                <DebtCard :debtObject="debt"/>
            </router-link>
        </div>
    </div>
</template>

<script>
import DebtCard from '@/components/DebtCard.vue';
import debtService from '@/services/debt.service'
import useStoreDebt from '@/stores/debt.store';

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
        },
        selectDebt(debt) {
            const debtStore = useStoreDebt();
            debtStore.setDebt(debt);
        }
    },
    mounted() {
        this.getAll()
    }
}
</script>

<style scoped>
.container-home {
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    background-color: rgb(70, 54, 54);
    color: white;
}

.debt-container {
    width: 30%;
    margin-bottom: 1%;
}
</style>