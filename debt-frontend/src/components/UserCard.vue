<template>
    <div class="container-user-card">
        <font-awesome-icon icon="credit-card" class="icon" />
        <h2>{{ user.name }}</h2>
        <div class="amount-side">
            <p class="amount" :class="[{'positive': user.value >= 0}, {'negative': user.value < 0}]">{{ parseFloat(user.value).toFixed(2) }}€</p>
        </div>
    </div>
</template>

<script>

export default {
    name: 'UserCard',
    props: {
        user: Object
    },

}

</script>

<style scoped>
.container-user-card {
    color: white;
    padding: 10px;
    display: flex;
    align-items: center;
    gap: 20%;
    border-radius: 15px;
    background-color: rgb(27, 24, 24);
}

.amount{
    font-size: large;
}

.positive{
    color: green;
}

.negative{
    color: red;
}

.icon {
    margin-left: 5%;
    color: yellow;
    font-size: 40px;
}

.amount-side{
    display: flex;
    justify-content: center;
    margin-left: auto;
    margin-right: 2%;
}
</style>