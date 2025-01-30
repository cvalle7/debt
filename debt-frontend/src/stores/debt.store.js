import { defineStore } from "pinia";

const useStoreDebt = defineStore('debtStore', {
    state: () => ({
        debt_id: null,
    }),
    actions: {
        setDebt(debt_id) {
            this.debt_id = debt_id
        }
    },
    persist: true
})

export default useStoreDebt;