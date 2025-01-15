<template>
    <div class="container-debt">
        <h1 class="tittle">{{ debt.name }}</h1>
        <div v-for="(people, index) in debt.people" :key="index" class="user-card">
            <UserCard :user="people" />
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

            this.debt.people.map(p => {p.pay = 0; p.value = 0})

            for (let pay of this.debt.pays) {
                let payPart = pay.amount / pay.payFor.length

                const payB = this.debt.people.filter(p => p.id === pay.payBy);
                let userPay = payB[0];
                userPay.pay += pay.amount;
                userPay.value += pay.amount;

                for(let pf of pay.payFor){
                    const pFor = this.debt.people.filter(p => p.id === pf);
                    let userPayFor = pFor[0];
                    userPayFor.value -= payPart
                }
            }
        }
    },
    computed: {
        debt() {
            const debtStore = useStoreDebt();
            return debtStore.debt;
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

.user-card {
    width: 30%;
    margin-bottom: 1%;
}

.tittle{
    margin: 4% 0;
}
</style>