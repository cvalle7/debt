<template>
    <div class="card-container" @click="popUp">
        <font-awesome-icon icon="money-bill-wave" class="icon" />
        <h2>{{ debtObject.name }}</h2>
    </div>
</template>

<script>
export default {
    props: {
        debtObject: Object
    },
    name: 'DebtCard',
    data() {
        return {
            count: 0,
        }
    },
    methods: {
        popUp() {
            this.count++
            if (this.count == 20) {
                alert('Oye para ya no? Eres bastante gay');
                this.count = 0;
            }
        }
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
    background-color: rgb(66, 54, 54);
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