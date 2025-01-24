<template>
    <div class="container-debt">
        <h1 class="tittle">{{ debt.name }}</h1>



        <PayModal :visible="isVisible" @close="closeModal">
            <form class="modal-content" @submit="addPay">
                <h1>Add pay</h1>
                <div class="separator">
                    <label class="label-tittle" :for="tittle">Tittle</label>
                    <input :id="tittle" type="text" placeholder="Tittle" v-model="tittle" required />
                </div>
                <div class="separator">
                    <label class="label-tittle" :for="importDebt">Import</label>
                    <input :id="importDebt" type="number" v-model="importData" required />
                </div>
                <label class="label-tittle" :for="selector">Pay by:</label>
                <select class="separator" v-model="payBy">
                    <option v-for="(people, index) in debt.people" :key="index" :value="people.id">
                        {{ people.name }}
                    </option>
                </select>
                <div class="separator">
                    <label class="label-tittle">Pay for:</label>
                    <div v-for="(people, index) in debt.people" :key=index>
                        <label :for="people.id">{{ people.name }}</label>
                        <input :id="people.id" type="checkbox" :value="people.id" v-model="payFor" />
                    </div>
                </div>
                <div class="modal-buttons">
                    <button class="button-modal save" type="submit">Save</button>
                    <button class="button-modal close" @click="closeModal">Cancel</button>
                </div>
            </form>

        </PayModal>



        <div class="subcontainer" :class="[{ 'hidden': saldosSelector == false }]">
            <div class="scroll-container">
                <div v-for="(people, index) in debt.people" :key="index" class="user-card">
                    <UserCard :user="people" />
                </div>
            </div>
            <div class="footer">
                <div class="selector">
                    <button :class="[{ 'selected': saldosSelector == true }]" class="selector-button"
                        @click="changeSaldoSelector()">Saldos</button>
                    <button :class="[{ 'selected': gastosSelector == true }]" class="selector-button"
                        @click="changeGastosSelector()">Gastos</button>
                </div>
                <button class="add-payment" @click="openModal">
                    +
                </button>
            </div>
        </div>
        <div class="subcontainer" :class="[{ 'hidden': gastosSelector == false }]">
            <div class="scroll-container">
                <div v-for="(pay, index) in debt.pays" :key="index" class="user-card">
                    <PayCard :pay="pay" :debt="debt" />
                </div>
            </div>
            <div class="footer">
                <div class="selector">
                    <button :class="[{ 'selected': saldosSelector == true }]" class="selector-button"
                        @click="changeSaldoSelector()">Saldos</button>
                    <button :class="[{ 'selected': gastosSelector == true }]" class="selector-button"
                        @click="changeGastosSelector()">Gastos</button>
                </div>
                <button class="add-payment" @click="openModal">
                    +
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import PayModal from '@/components/modals/PayModal.vue';
import PayCard from '@/components/PayCard.vue';
import UserCard from '@/components/UserCard.vue';
import useStoreDebt from '@/stores/debt.store';

export default {
    name: 'DebtView',
    methods: {
        changeSaldoSelector() {
            this.gastosSelector = false;
            this.saldosSelector = true;
        },
        changeGastosSelector() {
            this.gastosSelector = true;
            this.saldosSelector = false;
        },
        openModal() {
            this.isVisible = true
        },
        closeModal() {
            this.isVisible = false
        },
        addPay() {
            if (this.payFor.length > 0 && this.importData > 0) {
                const pay = {
                    name: this.tittle,
                    payId: this.debt.pays.length+1,
                    payBy: this.payBy,
                    amount: this.importData,
                    payFor: this.payFor
                }
                this.debt.pays.push(pay);
            }
            this.isVisible = false;
        }
    },
    computed: {
        debt() {
            const debtStore = useStoreDebt();
            debtStore.debt.people.map(p => { p.pay = 0; p.value = 0 })

            for (let pay of debtStore.debt.pays) {
                let payPart = pay.amount / pay.payFor.length

                const payB = debtStore.debt.people.filter(p => p.id === pay.payBy);
                let userPay = payB[0];
                userPay.pay += pay.amount;
                userPay.value += pay.amount;

                for (let pf of pay.payFor) {
                    const pFor = debtStore.debt.people.filter(p => p.id === pf);
                    let userPayFor = pFor[0];
                    userPayFor.value -= payPart
                }
            }
            return debtStore.debt;
        },
    },
    data() {
        return {
            gastosSelector: false,
            saldosSelector: true,
            isVisible: false,
            tittle: '',
            isPaid: 0,
            payBy: 0,
            payFor: [],
            importData: 0
        }
    },
    components: {
        UserCard,
        PayCard,
        PayModal
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
    height: 70vh;
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
    margin-top: auto;
}

.selector-button {
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

.selector-button:hover {
    background-color: #EFEFEF;
    cursor: pointer;
    color: black;
}

.selected {
    background-color: #EFEFEF;
    color: black;
}

.scroll-container {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    flex-direction: column;
    width: 100%;
    height: 85%;
    overflow-y: scroll;
    scrollbar-width: none;
}

.scroll-container::-webkit-scrollbar {
    display: none;
}

.footer {
    margin-left: 39%;
    display: flex;
    width: 100%;
    align-items: flex-start;
    gap: 5%;
}

.add-payment {
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
    border-radius: 20px;
    width: 10%;
    height: 70%;
    font-size: large;
    font-weight: 700;
    background-color: rgb(43, 134, 40);
    transition: background-color 0.5s ease;
}

.add-payment:hover {
    background-color: rgb(16, 95, 13);
    border: 2px solid black;
    cursor: pointer;
}

.modal-content {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.separator {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-bottom: 10%;
}

.label-tittle {
    font-size: large;
    font-weight: 600;
}

.modal-buttons {
    margin-top: 20%;
    width: 100%;
    height: 5vh;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10%;
}

.button-modal {
    width: 40%;
    height: 70%;
    border: 1px solid black;
    border-radius: 15px;
    color: white;
    font-size: medium;
    font-weight: 600;
    transition: background-color 0.5s ease;
}

.save {
    background-color: rgb(43, 134, 40);
}

.save:hover {
    background-color: rgb(16, 95, 13);
    border: 2px solid black;
    cursor: pointer;
}

.close {
    background-color: rgb(179, 26, 26);
}

.close:hover {
    background-color: rgb(134, 4, 4);
    border: 2px solid black;
    cursor: pointer;
}
</style>