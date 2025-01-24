<template>
    <div class="pay-card-container">
        <font-awesome-icon icon="coins" class="icon" />
        <div class="data-container">
            <p class="tittle">{{ pay.name }}</p>
            <p> pay by: {{ payer.name }}</p>
        </div>
        <p class="payment">{{pay.amount}}€</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            payer: Object
        }
    },
    props: {
        debt: Object,
        pay: Object
    },
    methods: {
        getData() {
            let people = this.debt.people.filter(p => p.id === this.pay.payBy);
            this.payer = people[0];
        }
    },
    mounted() {
        this.getData()
    }
}
</script>

<style scoped>
.pay-card-container {
    color: white;
    padding: 10px;
    display: flex;
    align-items: center;
    gap: 15%;
    border-radius: 15px;
    background-color: rgb(27, 24, 24);
    height: 4vh;
}

.data-container{
    display: flex;
    align-items: flex-start;
    flex-direction: column;
}

.data-container p{
    margin: 0;
}

.icon{
    margin-left: 5%;
    color: yellow;
    font-size: 30px;
}

.payment{
    display: flex;
    margin-left: auto;
    margin-right: 4%;
    font-size: large;
}

.tittle{
    font-size: large;
    font-weight: 700;
}
</style>