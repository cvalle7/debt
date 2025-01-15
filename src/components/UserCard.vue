<template>
    <div class="container-user-card">
        <h2>{{ user.name }}</h2>
        <p class="amount" :class="[{'positive': user.value >= 0}, {'negative': user.value < 0}]">{{ user.value }}€</p>
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
    transition: background-color 0.5s ease;
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
</style>