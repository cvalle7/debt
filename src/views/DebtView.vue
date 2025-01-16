<template>
    <div class="container-debt">
        <h1 class="tittle">{{ debt.name }}</h1>
        <div class="subcontainer" :class="[{ 'hidden': saldosSelector == false }]">
            <div v-for="(people, index) in debt.people" :key="index" class="user-card">
                <UserCard :user="people" />
            </div>
            <div class="selector">
                <button :class="[{'selected': saldosSelector == true}]" class="selector-button" @click="changeSaldoSelector()">Saldos</button>
                <button :class="[{'selected': gastosSelector == true}]" class="selector-button" @click="changeGastosSelector()">Gastos</button>
            </div>
        </div>
        <div class="subcontainer" :class="[{ 'hidden': gastosSelector == false }]">
            <div class="selector">
                <button :class="[{'selected': saldosSelector == true}]" class="selector-button" @click="changeSaldoSelector()">Saldos</button>
                <button :class="[{'selected': gastosSelector == true}]" class="selector-button" @click="changeGastosSelector()">Gastos</button>
            </div>
        </div>
    </div>
</template>

<script>
import UserCard from '@/components/UserCard.vue';
import useStoreDebt from '@/stores/debt.store';

export default {
    name: 'DebtView',
    methods: {
        getValues() {

            this.debt.people.map(p => { p.pay = 0; p.value = 0 })

            for (let pay of this.debt.pays) {
                let payPart = pay.amount / pay.payFor.length

                const payB = this.debt.people.filter(p => p.id === pay.payBy);
                let userPay = payB[0];
                userPay.pay += pay.amount;
                userPay.value += pay.amount;

                for (let pf of pay.payFor) {
                    const pFor = this.debt.people.filter(p => p.id === pf);
                    let userPayFor = pFor[0];
                    userPayFor.value -= payPart
                }
            }
        },
        changeSaldoSelector() {
            this.gastosSelector = false;
            this.saldosSelector = true;
        },
        changeGastosSelector(){
            this.gastosSelector = true;
            this.saldosSelector = false;
        }
    },
    computed: {
        debt() {
            const debtStore = useStoreDebt();
            return debtStore.debt;
        }
    },
    data() {
        return {
            gastosSelector: false,
            saldosSelector: true
        }
    },
    mounted() {
        this.getValues()
    },
    components: {
        UserCard
    }
}

</script>

<style scoped>
.container-debt {
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    background-color: rgb(70, 54, 54);
    color: white;
}

.subcontainer {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    border-radius: 15px;
    background-color: rgb(77, 71, 71);
    width: 50%;
}

.user-card {
    margin-top: 2%;
    width: 60%;
}

.tittle {
    margin: 4% 0 3% 0;
}

.hidden {
    display: none;
}

.selector {
    width: 60%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 2% 0;
    border: 2px solid #EFEFEF;
    border-radius: 5px;
}

.selector-button{
    color: white;
    background-color: #1B1818;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50%;
    height: 5vh;
    font-size: large;
    transition: background-color 0.5s ease;
}

.selector-button:hover{
    background-color: #EFEFEF;
    cursor: pointer;
    color: black;
}

.selected{
    background-color: #EFEFEF;
    color: black;
}
</style>