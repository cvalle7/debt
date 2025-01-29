<template>
    <div class="container-home">

        <DebtModal :isActive="isActive" @close="deactiveModal">
            <h1>Create debt</h1>
            <form class="debt-form" @submit.prevent="addDebt">
                <div class="separator">
                    <label class="label-tittle" :for="title - id">Title</label>
                    <input :id="title - id" type="text" v-model="title" required />
                </div>
                <div class="separator">
                    <label class="label-tittle">Participants</label>
                    <div v-for="(p, index ) in people" :key="index">
                        <input type="text" v-model="p.name" required />
                        <button class="delete-participant" v-if="(people.length > 1)"
                            @click="deleteParticipant(p)">X</button>
                    </div>
                    <button class="add-participant" @click="addParticipant">
                        Add participant
                    </button>
                </div>
                <div class="modal-buttons">
                    <button class="button-modal save" type="submit">Save</button>
                    <button class="button-modal close" @click="deactiveModal">Cancel</button>
                </div>
            </form>
        </DebtModal>

        <h1 class="tittle">Welcome to debt app</h1>
        <div class="scroll-container">
            <div v-for="(debt, index) in cardList" :key="index" class="debt-container">
                <router-link to="/debt">
                    <DebtCard :debtObject="debt" />
                </router-link>
            </div>
        </div>

        <button class="addDebt" @click="activeModal">
            +
        </button>
    </div>
</template>

<script>
import DebtCard from '@/components/DebtCard.vue';
import DebtModal from '@/components/modals/DebtModal.vue';
import debtService from '@/services/debt.service'
import useStoreDebt from '@/stores/debt.store';

export default {
    name: 'HomeView',
    components: {
        DebtCard,
        DebtModal
    },
    data() {
        return {
            cardList: [],
            isActive: false,
            title: '',
            people: [{ name: '' }]
        }
    },
    methods: {
        async getAll() {
            this.cardList = await debtService.getAllDebt();
        },
        selectDebt(debt) {
            const debtStore = useStoreDebt();
            debtStore.setDebt(debt);
        },
        activeModal() {
            this.isActive = true;
        },
        deactiveModal() {
            this.isActive = false;
        },
        addParticipant() {
            this.people.push({ name: '' })
        },
        deleteParticipant(participant) {
            this.people.pop(participant)
        },
        addDebt(){

            const debt = {
                name: this.title,
                money: 0,
                people: this.people,
                pays: []
            }
            this.cardList.push(debt);
            this.isActive = false;
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

.scroll-container {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    width: 100%;
    height: 50%;
    overflow-y: scroll;
    scrollbar-width: none;
}

.scroll-container::-webkit-scrollbar {
    display: none;
}

.debt-container {
    width: 30%;
    margin-bottom: 1%;
    text-decoration: none !important;
}

.debt-container a {
    text-decoration: none !important;
}

.tittle {
    margin: 4% 0;
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

.addDebt {
    margin-top: 1%;
    border: none;
    width: 4%;
    height: 8%;
    border-radius: 50%;
    background-color: rgb(43, 134, 40);
    transition: background-color 0.5s ease;
    font-size: 25px;
}

.addDebt:hover {
    background-color: rgb(16, 95, 13);
    border: 2px solid black;
    cursor: pointer;
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

.add-participant {
    background-color: rgb(27, 106, 255);
    border: none;
    border-radius: 5px;
    margin-top: 1%;
    color: white;
    transition: background-color 0.2s ease;
}

.add-participant:hover {
    background-color: rgb(27, 42, 255);
    cursor: pointer;
}

.delete-participant {
    background-color: rgb(255, 28, 65);
    border: none;
    border-radius: 5px;
    margin-left: 2px;
    color: white;
    height: 2vh;
    transition: background-color 0.3s ease;
}

.delete-participant:hover {
    background-color: rgb(170, 0, 0);
    cursor: pointer;
}
</style>