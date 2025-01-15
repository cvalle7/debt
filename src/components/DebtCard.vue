<template>
    <div class="card-container" @click="popUp">
        <font-awesome-icon icon="money-bill-wave" class="icon" />
        <h2>{{ debt.name }}</h2>
        <p>{{ debt.money }}€</p>
    </div>
</template>

<script>
import useStoreDebt from '@/stores/debt.store';

export default {
    props: {
        debtObject: Object
    },
    data() {
        return {
            debt: Object
        }
    },
    name: 'DebtCard',
    methods: {
        popUp() {
            const debtStore = useStoreDebt();
            debtStore.setDebt(this.debt)
        },
        getAmount() {
            this.debt = this.debtObject
            let amount = 0;
            for (let pay of this.debt.pays) {
                amount += pay.amount;
            }
            this.debt.money = amount;
        }
    },
    mounted() {
        this.getAmount();
    }
}

</script>

<style scoped>
.card-container {
    color: white;
    padding: 10px;
    display: flex;
    align-items: center;
    gap: 20%;
    border-radius: 15px;
    background-color: rgb(27, 24, 24);
    transition: background-color 0.5s ease;
}

.card-container:hover {
    background-color: rgb(0, 0, 0);
}

.icon {
    margin-left: 5%;
    color: green;
    font-size: 40px;
}
</style>