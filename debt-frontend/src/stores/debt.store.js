import { defineStore } from "pinia";

const useStoreDebt = defineStore('debtStore', {
    state: () => ({
        debt: null,
    }),
    actions: {
        setDebt(newDebt) {
            this.debt = newDebt
        }
    },
    persist: true
})

export default useStoreDebt;