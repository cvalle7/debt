<template>
    <div>
        {{ debt }}
    </div>
</template>

<script>
export default {
    name: 'DebtView',
    props: {
        debt: Object
    },
    data() {
        return {
            number: 0
        }
    },
    mounted() {
        console.log('entro');
        console.log(this.debt)
    }
}

</script>

<style scoped></style>