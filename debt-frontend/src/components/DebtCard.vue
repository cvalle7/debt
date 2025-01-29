<template>
    <div class="card-container" @click="popUp">
        <font-awesome-icon icon="money-bill-wave" class="icon" />
        <h2>{{ debtObject.name }}</h2>
        <div class="amount-side">
            <p>{{ debtObject.money }}€</p>
        </div>
    </div>
</template>

<script>
import useStoreDebt from '@/stores/debt.store';

export default {
    props: {
        debtObject: Object
    },
    name: 'DebtCard',
    methods: {
        popUp() {
            const debtStore = useStoreDebt();
            debtStore.setDebt(this.debtObject)
        }
    },
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

.amount-side{
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: auto;
    margin-right: 3%;
}

.amount-side p{
    font-size: large;
}
</style>